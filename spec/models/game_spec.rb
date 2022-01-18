require 'rails_helper'

RSpec.describe Game, type: :model do
  it { is_expected.to be }

  it 'is not valid game object' do
    competition = Competition.create(name: "Africa Cup of Nations")
    game = Game.create(name: "", competition_id: competition.id)
    expect(game).to_not be_valid
  end

  it 'it is a valid game object' do
    competition = Competition.create(name: "Africa Cup of Nations")
    game = Game.create(name: "Dean's game", competition_id: competition.id)
    expect(game).to be_valid
  end
end