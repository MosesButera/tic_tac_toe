# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  subject(:board) { described_class.new }
  let(:display) { instance_double }

  describe '#display' do
    it 'it prints to the terminal' do
      expect { board.display }.to output(/.+/).to_stdout
    end
  end

  describe '#place_move(spot, marker)' do
    let(:place_move) { instance_double }
    context 'Updates the specific spot on the board with the players marker (X or O)' do
      it 'The updated the cell at the given spot now contains the players marker' do
        expect { board.place_move(0, 'X') }.to change { board.grid[0] }.from('.').to('X')
      end
    end
  end
end
