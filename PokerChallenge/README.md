# Poker Challenge

Setup
-----
- Clone this repo.
- Make sure you have `stack` installed. 
- If not, you can download it [here](https://docs.haskellstack.org/en/stable/README/#how-to-install).
- Describe a poker table in a file `Game.table` according to `Game.table.example`.
- First row should be a rule set, one of COMP, MR, STR, or MS
- Second row should be 5 board cards, space delimited.
- From third row down, each row should be the 2 pocket cards of a player.
- The game supports 2-10 players inclusive.
- Each card should be described by its rank and suit in two characters, e.g. `5s` for `five of spaces`,
or `Th` for `ten of hearts`, or `Kc` for `king of clubs`.
- When you have the table setup, run `stack build && stack run Poker`.
- You'll see the winning hands of the table printed on the screen. :)


Resources
---------
Tests:
- [Tasty with HUnit](https://github.com/andybalaam/hunit-example)
