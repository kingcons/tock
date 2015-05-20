class Board
  def initialize(n)
    @width = n
    @spaces = (1..n*n).to_a
    @wins = build_wins
  end

  def initialize_clone(original)
    super
    @spaces = original.instance_variable_get(:@spaces).clone
  end

  def legal_moves
    @spaces.select { |x| x.is_a? Fixnum }
  end

  def legal_move?(move)
    self.legal_moves.include?(move)
  end

  def move!(space, player)
    @spaces[space - 1] = player.piece
  end

  def game_over?
    self.full? || self.win?
  end

  def full?
    @spaces.all? { |x| x.is_a? String }
  end

  def win?
    @wins.any? do |indexes|
      indexes.map { |x| @spaces[x] }.uniq.length == 1
    end
  end

  def winner?(player)
    @wins.any? do |indexes|
      indexes.all? { |x| @spaces[x] == player.piece }
    end
  end

  def score(player)
    if self.winner?(player)
      10
    elsif self.win?
      -10
    else
      0
    end
  end

  def successor(space, player)
    next_state = self.clone
    next_state.move!(space, player)
    next_state
  end

  def to_s
    @spaces.each_slice(@width).map{ |row| row.join(' | ') }.join("\n")
  end

  private
  def build_wins
    indexes = @spaces.map { |x| x - 1 }

    wins = []
    # Rows first
    wins += indexes.each_slice(@width).to_a
    # Columns next
    wins += indexes.group_by { |x| x % @width }.values
    # Diagonals last but only if @width is odd because otherwise WAT
    if @width.odd?
      # It would be nice to have a stronger mathematical intuition for why this works.
      wins << indexes.select { |x| x % (@width + 1) == 0 }
      wins << indexes.select { |x| x % (@width - 1) == 0 }[1 .. -2]
    end

    wins
  end
end
