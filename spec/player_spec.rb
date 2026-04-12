# frozen_string_literal: true

require_relative '../lib/player'

describe Player do
  subject(:player) { described_class.new('X') }
  # use an instance_double to mock the board dependency
  let(:board_double) { instance_double('Board') }

  describe '#choose_move(board)' do
    context 'when user input is valid' do
      before do
        # Stub terminal IO to prevent actual typing/printing
        allow(player).to receive(:puts)
        allow(player).to receive(:gets).and_return("5\n")

        # Stub the board's response
        allow(board_double).to receive(:is_cell_empty?).with(4).and_return(true)
      end

      it 'returns the zero-indexed move' do
        expect(player.choose_move(board_double)).to eq(4)
      end
    end

    context 'when the spot is already taken' do
      it 'shows invalid move message and retries' do
        allow(player).to receive(:puts)
        allow(player).to receive(:gets).and_return("5\n", "1\n")

        # Mock different board response
        allow(board_double).to receive(:is_cell_empty?).with(4).and_return(false)
        allow(board_double).to receive(:is_cell_empty?).with(0).and_return(true)

        expect(player).to receive(:puts).with('Invalid move.').once
        player.choose_move(board_double)
      end
    end
  end
end
