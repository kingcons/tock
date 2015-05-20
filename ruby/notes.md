# Welcome to Intermediate Ruby Group!

## Tock and Negamax

* [Brit Butler](https://twitter.com/redline6561)
* May 20, 2015

---

# About AIR

* Restarting after the founder moved to DC.

--

* Project focused, mentoring focused.

--

* We're interested in the nitty gritty.
* Used a new language? Great.
* Used a cool library? Fine.

--

* **Tell us what you built with it.**

---

# Tic-Tac-Toe

* A game of Tic-Tac-Toe.

--

* With AI! (wow)

--

* We remember [Tic Tac Toe][ttt], right?

--

* It's a special case of [m,n,k games][mnk].

* But specifics are pedagogically helpful.

* **Disclaimer**: I have not tried my algorithm on arbitrary m,n,k games.

[ttt]: http://en.wikipedia.org/wiki/Tic-tac-toe
[mnk]: http://en.wikipedia.org/wiki/M,n,k-game

---

# Enter Tock

* [Tock][tock] on github.

--

* Loose feature overview:

  1. Any mixture of 2 Human/Computer/SuperComputer players.

--

  2. Any NxN board size. (Diagonal wins only supported on odd boards.)

--

  3. Some tests I guess. (Yeah, not really a feature.)

--

* The following objects:

--

  * **Board**

--

  * **Human**, **Computer**, **SuperComputer**

--

  * **TicTacToe**

--

  * **Menu**

[tock]: https://github.com/redline6561/tock

---

# Enter Minimax (jk Negamax)

* **Disclaimer:** I threw these slides together this afternoon. Expect whiteboarding.

--

* **Final Disclaimer:** I wrote all this code in about 5 hours Sunday and last night.

--

The core idea is pretty simple actually ...

1. Write a scoring function for your game state.

--

2. Recursively enumerate all possible future game states.

--

3. ???

--

4. **PROFIT!**

---

# Uhhh....

.center[![mind_blown](http://img.pandawhale.com/post-28553-Steve-Jobs-mind-blown-gif-HD-T-pVbd.gif)]

---

# Okay

* Every "Game State" can lead to a number of possible future states based on
  how a player chooses to move.

--

* Those states have their own future states based on the opponent's move and so on.

--

* We build the "Game Tree" then we just have to walk up and down it and
  figure out the move with the "best score".

--

* Recursion is a natural fit for tree traversal.

--

* Not a super common technique in Ruby. You can blow the stack if you're not careful.

--

* (Recent Rubies do support Tail Call Optimization, not sure how involved this is.)

---

# Game Theory

* Y'all saw A Beautiful Mind, right?

--

* Minimax works because Tic Tac Toe is a Zero-Sum game with perfect information.

--

* God we are so smart.

.center[![beautiful][abm_gif]]

[abm_gif]: https://38.media.tumblr.com/af11556cb7510fc75d4a9fe4f42f30fe/tumblr_n2ma8g41tx1tvjti3o1_500.gif

---

# So I've heard of Minimax, Why Negamax?

* Really just a coding simplification.

* Has to do with how we track the scores for alternating players.

[minimax]: http://en.wikipedia.org/wiki/Minimax
[negamax]: http://en.wikipedia.org/wiki/Negamax

---

# How to Test Negamax Mo Betta

1. Test prevention of forks. If the opponent forks, we've lost already.

   (Sidebar: How many ways can you set up a fork?)

--

2. Test that we block opponent wins.

--

3. Test that we take available wins.

---

# Optimization

* Well, run [Rubinius][rubinius] (currently not installable on Yosemite `T_T`).

--

* Or rewrite it in: **C**, **Lisp**, **OCaml**, etc.

--

* "Here's a nickel kid, get yerself a real programming language."

--

* ^^ `#jerk`

[rubinius]: http://rubini.us/

---

# Optimization, pt. 2

## Use a better algorithm!

* Look into [Alpha-Beta Pruning][abp].

--

* Look into [Principal Variation Search][pvs].

--

* Both are fundamentally about limiting how much of the Game Tree you have to search.

[abp]: http://en.wikipedia.org/wiki/Alpha%E2%80%93beta_pruning
[pvs]: http://en.wikipedia.org/wiki/Principal_variation_search

---

# Questions?

