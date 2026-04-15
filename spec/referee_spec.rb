# frozen_string_literal: true

require_relative '../lib/referee'

describe Referee do
  subject(:referee) { described_class.new }
  # Use an instance_double to mock the board dependency/
  let(:board_double) { instance_double('Board') }
  # Simulate winning grid combination
  let(:horizontal) { ['X', 'X', 'X', '.', '.', '.', '.', '.', '.'] }
  let(:vertical) { ['X', '.', '.', 'X', '.', '.', 'X', '.', '.'] }
  let(:diagonal) { ['X', '.', '.', '.', 'X', '.', '.', '.', 'X'] }
  let(:fresh_board) { ['.', '.', '.', '.', '.', '.', '.', '.', '.'] }
  describe '#check_winner(board)' do
    context 'Returns winner X for horizontal lines' do
      it "returns 'X' for horizontal" do
        allow(board_double).to receive(:grid).and_return(horizontal)
        expect(referee.check_winner(board_double)).to eq('X')
      end
    end

    context 'Returns winner X or O for vertical lines' do
      it "returns 'X' for vertical" do
        allow(board_double).to receive(:grid).and_return(vertical)
        expect(referee.check_winner(board_double)).to eq('X')
      end
    end

    context 'Returns winner X or O for diagonal lines' do
      it "returns 'X' for diagonal" do
        allow(board_double).to receive(:grid).and_return(diagonal)
        expect(referee.check_winner(board_double)).to eq('X')
      end
    end

    context 'Returns nil for a board with no three-in-a-row' do
      it 'returns nil for a fresh board' do
        allow(board_double).to receive(:grid).and_return(fresh_board)
        expect(referee.check_winner(board_double)).to eq(nil)
      end
    end
  end

  describe '#is_draw?(board)' do
    context 'When its a draw' do
      it 'returns true if board is full and there is no winner' do
        allow(board_double).to receive(:is_full?).and_return(true)
        allow(referee).to receive(:check_winner).with(board_double).and_return(nil)
        expect(referee.is_draw?(board_double)).to be(true)
      end
    end

    context 'When there is a winner' do
      # initialize variable to simulate either winner X or O
      let(:winner_X_or_O) { match(/\A[XO]\z/i) }
      it 'returns true if board is full and there is a winner' do
        allow(board_double).to receive(:is_full?).and_return(true)
        allow(referee).to receive(:check_winner).with(board_double).and_return(winner_X_or_O)
        expect(referee.is_draw?(board_double)).to be(false)
      end
    end
  end
end
