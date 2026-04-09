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
end
