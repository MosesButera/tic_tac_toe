# Tic Tac Toe (ruby)

Simple Tic-Tac-Toe implemented in Ruby.  
One-class-per-file structure in `lib/`, a small `main.rb` runner, and a `Gemfile` with development tooling (Rubocop).

---

## Quick start (copy / paste)

1. Install Ruby (recommended: rbenv or rvm).  
2. From the project root run:

```bash
bundle install        # installs rubocop
ruby main.rb          # run the game script

If you see bundle: command not found, install Bundler: gem install bundler or use your Ruby manager docs.

Project layout

project-root/
├── Gemfile
├── Gemfile.lock
├── README.md
├── main.rb
└── lib/
    ├── people.rb
    ├── player.rb
    └── referee.rb

lib/people.rb — common helpers & the board printing routine and shared @@rows.

lib/player.rb — Player class (inherits from People): responsible for making a move.

lib/referee.rb — Referee class (inherits from People): responsible for checking the winner.

main.rb — lightweight script that wires the pieces and demonstrates playing.


What this project solves (core problem & approach)

    Core problem: Represent a 3×3 Tic-Tac-Toe board and decide whether either player (X or O) has won, or the game should continue.

    High-level solution (why it works):

    The board is represented as a 2D array (rows), [['.', '.', '.'], ['.', '.', '.'], ['.', '.', '.']].

    We compute the 8 possible winning lines (3 rows, 3 columns, 2 diagonals).

    To check a winner we inspect each line: if all elements are the same and not '.', the player owning that symbol wins.

    We keep responsibilities separated:

    Player only changes the board (encapsulation of move logic).

    Referee only inspects the board and decides results.

    People contains shared code for printing and board storage.

    This separation follows good OOP practice (single responsibility, encapsulation, small classes).


PSEUDOCODE:

START program

SET board = 3x3 array of '.' characters

DEFINE print_table(board)
  print top border
  for each row in board:
    print row formatted with vertical separators
    print border line
END

CLASS Player:
  constructor(name, symbol)
    store name and symbol
  method play(row, col)
    place symbol into board[row][col]
    print the table

CLASS Referee:
  constructor(name)
    store name
  method check_winner(board)
    compute 8 lines:
      3 horizontal rows
      3 vertical columns
      2 diagonals
    for each line:
      if all 3 elements are the same AND not '.':
        return "<symbol> wins"
    return "no winner, continue playing"

MAIN:
  create players and referee
  players make moves (example)
  referee.check_winner(board)
  print result
END

How to test manually (quick example)

    Open main.rb and run it:

    It should show the printed board

    Then show the referee output such as X wins diagonally or Continue playing. no winner!

Troubleshooting

    If printing looks off on Windows, ensure your console supports ASCII and you use a compatible font.

    If bundle install fails, check Ruby version and Bundler installation.