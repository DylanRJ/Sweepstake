require 'rails_helper'

RSpec.describe Player, type: :model do
  
  it { is_expected.to be }
 
  it 'it is a valid player object' do
    competition = Competition.create(name: "Africa Cup of Nations")
    game = Game.create(name: "Dean's game", competition_id: competition.id)
    player = Player.create(name: "John", game_id: game.id)
    expect(player).to be_valid
  end
end

