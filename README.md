# Tic Tac Toe (Ruby)

Terminal-based Tic-Tac-Toe built in Ruby with a focus on clean architecture, testability, and object-oriented design.

---

## Overview

This project models the game using small, focused classes instead of a monolithic script.  
Game logic, state management, and user interaction are separated to keep the code easy to reason about and extend.

---

## Features

- Clear separation of responsibilities (Board, Player, Referee, Game)
- Input validation with a user feedback loop
- Win and draw detection
- Fully tested with RSpec

---

## Design Notes

- **Single Responsibility Principle**: each class handles one concern  
- **Command–Query Separation**: methods either mutate state or return data, not both  
- **Decoupled components**: improves testability and predictability  

---

## Why This Project Matters

This project is intentionally simple in scope but structured like a larger system.  
It demonstrates the ability to:

- Break problems into independent components  
- Apply OOP principles effectively  
- Reason about design tradeoffs  
- Write testable, maintainable code  

---

## Pseudocode

START PROGRAM

CLASS Board
    METHOD initialize
        SET grid = array of 9 empty spaces
    
    METHOD display
        CLEAR terminal screen
        PRINT guide board (1–9)
        PRINT current grid with separators (+---+---+)
    
    METHOD place_move(index, marker)
        UPDATE grid at index with marker
    
    METHOD is_cell_empty?(index)
        RETURN true if grid at index is empty
    
    METHOD is_full?
        RETURN true if all cells are not empty
END


CLASS Player
    METHOD initialize(marker)
        SET marker = marker (X or O)
    
    METHOD choose_move(board)
        LOOP
            PROMPT user for input (1–9)
            CONVERT input to zero-indexed integer
            IF input is valid AND board.is_cell_empty?(input)
                RETURN input
            ELSE
                PRINT "Invalid move, try again"
        END LOOP
END


CLASS Referee
    METHOD check_winner(board)
        SET win_patterns = [rows, columns, diagonals]
        FOR EACH pattern IN win_patterns
            IF all 3 cells in pattern are equal and not empty
                RETURN marker (winner)
        RETURN nil
    
    METHOD is_draw?(board)
        RETURN true if board is_full? AND check_winner is nil
END


CLASS Game
    METHOD initialize(board, referee)
        SET @board = board
        SET @referee = referee
        SET @p1 = Player('X')
        SET @p2 = Player('O')
        SET @current_player = @p1
    
    METHOD switch_player
        IF @current_player is @p1
            SET @current_player = @p2
        ELSE
            SET @current_player = @p1
    
    METHOD start_game
        LOOP
            board.display
            SET move = @current_player.choose_move(@board)
            board.place_move(move, @current_player.marker)
            
            IF referee.check_winner(@board)
                PRINT winner marker + " wins!"
                BREAK
            ELSE IF referee.is_draw?(@board)
                PRINT "Draw!"
                BREAK
            
            switch_player
        END LOOP
END


MAIN
    SET game = new Game
    game.start_game
END

---

## Getting Started

bundle install
ruby main.rb

---

## Directory Structure

```text
.
├── main.rb             # Entry point (Runner)
├── lib/
│   ├── board.rb        # State management
│   ├── player.rb       # User interaction
│   ├── referee.rb      # Rule enforcement
│   └── game.rb         # Coordination
└── spec/               # RSpec test suite (unit tests)

