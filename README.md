Tic Tac Toe (Ruby)

  A clean, terminal-based Tic-Tac-Toe implementation following Object-Oriented Programming (OOP) principles and Command-Query Separation (CQS).

Quick Start

  1. Install Dependencies:
      bash
      bundle install

  2. Run the Game:
      bash  
      ruby main.rb

  3. Run Tests:
      bash
      bundle exec rspec

Project Summary:

  This project solves the challenge of managing game state and win-condition logic through a decoupled architecture. Instead of a single script, responsibilities are distributed across specialized classes to ensure maintainability and testability.

Directory Structure:

  .
  ├── main.rb             # Entry point (Runner)
  ├── lib/
  │   ├── board.rb        # State management
  │   ├── player.rb       # User interaction 
  │   ├── referee.rb      # Rule enforcement 
  │   └── game.rb         # Coordination 
  └── spec/               # RSpec test suite (Unit Tests)


PSEUDOCODE:

  -------------------------------------------------------------------------
  START PROGRAM

  CLASS Board
      METHOD initialize
          SET grid = Array of 9 empty spaces
      
      METHOD display
          CLEAR terminal screen
          PRINT guide board (1-9)
          PRINT current grid with separators (+---+---+)
      
      METHOD place_move(index, marker)
          UPDATE grid AT index WITH marker
      
      METHOD is_cell_empty?(index)
          RETURN true IF grid AT index IS empty
      
      METHOD is_full?
          RETURN true IF all cells ARE NOT empty
  END

  CLASS Player
      METHOD initialize(marker)
          SET marker = marker (X or O)
      
      METHOD choose_move(board)
          LOOP
              PROMPT user for input (1-9)
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
              IF all 3 cells in pattern ARE EQUAL and NOT empty
                  RETURN the marker (winner)
          RETURN nil
      
      METHOD is_draw?(board)
          RETURN true IF board is_full? AND check_winner is nil
  END

  CLASS Game
      METHOD initialize(board, referee)
          SET @board = board
          SET @referee = referee
          SET @p1 = Player('X')
          SET @p2 = Player('O')
          SET @current_player = @p1
      
      METHOD switch_player
          IF @current_player IS @p1 THEN SET @current_player = @p2
          ELSE SET @current_player = @p1
      
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
              END
              
              switch_player
          END LOOP
  END

  MAIN
      SET board = NEW Board
      SET referee = NEW Referee
      SET game = NEW Game(board, referee)
      game.start_game
  END
  -------------------------------------------------------------------------
