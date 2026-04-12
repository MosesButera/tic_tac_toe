# frozen_string_literal: true

require_relative '../lib/referee'

describe Referee do
  subject(:referee) { described_class.new }
  # use an instance_double to mock the board dependency
  let(:board_double) { instance_double('Board') }
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
end
