# frozen_string_literal: true

require_relative '../lib/game'

describe Game do
  subject(:game) { described_class.new }
  describe '#switch_player' do
    context 'When game starts' do
      it 'switches current_player from @p1 to @p2' do
        p1 = game.instance_variable_get(:@p1)
        p2 = game.instance_variable_get(:@p2)
        expect { game.switch_player }.to change { game.current_player }.from(p1).to(p2)
      end
    end

    context 'When switching back' do
      it 'it toggles current_player back from @p2 to @p1' do
        p1 = game.instance_variable_get(:@p1)
        game.switch_player
        expect { game.switch_player }.to change { game.current_player }.to(p1)
      end
    end
  end

  describe '#game_start' do
    # Override the global subject/class object for only this context and
    # inject board and referee doubles into game object being tested.
    subject(:game) { described_class.new(board: board_double, referee: referee_double) }
    let(:board_double) { instance_double('Board') }
    let(:referee_double) { instance_double('Referee') }
    context 'When there is a winner' do
      it "it sends display message to board, shows marker winner e.g 'X wins!' and terminates" do
        current_player = game.instance_variable_get(:@current_player)
        winning_message = "#{current_player.marker} wins!"
        # Setup: Referee returns true, loop will exit
        allow(referee_double).to receive(:check_winner).with(board_double).and_return(true)
        # Setup: Player provides a move so the code doesn't hang on 'gets'
        allow(current_player).to receive(:choose_move).and_return(1)

        expect(board_double).to receive(:display).at_least(:once)
        expect(game).to receive(:puts).with(winning_message).once
        expect(board_double).to receive(:place_move)

        game.start_game
      end
    end

    context 'When there is a draw.' do
      it "Sends display message to board, prints 'Draw!' message and terminates" do
        current_player = game.instance_variable_get(:@current_player)
        # Setup: Player provides a move so the code doesn't hang on 'gets'
        allow(current_player).to receive(:choose_move).and_return(1)
        # Setup: Referee doesn't trigger first if condition
        allow(referee_double).to receive(:check_winner).with(board_double).and_return(false)
        # Setup: Referee returns true for is_draw? loop will exit.
        allow(referee_double).to receive(:is_draw?).with(board_double).and_return(true)

        expect(board_double).to receive(:display).at_least(:once)
        expect(game).to receive(:puts).with('Draw!').once
        expect(board_double).to receive(:place_move)

        game.start_game
      end
    end

    context 'Where there is no winner or draw.' do
      it 'Sends a message to self to change current_player for next player turn' do
        p1 = game.instance_variable_get(:@p1)
        p2 = game.instance_variable_get(:@p2)

        # Setup:Stub the player to move twice once for p1, and once for p2
        allow(p1).to receive(:choose_move).and_return(1)
        allow(p2).to receive(:choose_move).and_return(2)

        # Stub the Board commands
        allow(board_double).to receive(:display)
        allow(board_double).to receive(:place_move)

        # Return false on the first iteration, then true on the second to break the loop
        allow(referee_double).to receive(:check_winner).and_return(false)
        # By the second iteration the the state has already changed.
        allow(referee_double).to receive(:is_draw?).and_return(false, true) # Exit on 2nd turn

        expect { game.start_game }.to change { game.current_player }.from(p1).to(p2)
      end
    end

    context 'During a standard move' do
      it 'passes the board to the player and the move/marker to the board' do
        p1 = game.instance_variable_get(:@p1)
        # We only need one turn, so we stub the winner check to be true immediately
        allow(board_double).to receive(:display)
        allow(referee_double).to receive(:check_winner).and_return(true)
        allow(game).to receive(:puts) # Ignore the win message print

        # Player receives the board. We expect it to return '5' as the move.
        expect(p1).to receive(:choose_move).with(board_double).and_return(5)
        # Board receives the '5' and the player's marker
        expect(board_double).to receive(:place_move).with(5, p1.marker)

        game.start_game
      end
    end
  end
end
