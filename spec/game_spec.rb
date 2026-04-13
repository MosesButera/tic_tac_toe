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
end
