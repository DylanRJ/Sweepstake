require 'rails_helper'

RSpec.describe PlayersController, type: :controller do
  describe "POST /players" do
    it "responds with 200" do
      competition = Competition.create(name: "Africa Cup of Nations")
      competition.save
      game = Game.create(name: "Dean's game", competition_id: competition.id)
      team = Team.create(name: "Algeria", competition_id: competition.id)
      post :create, params: { player: {name: "John"}, game_id: game.id }
      player = Player.find_by(competition_id: competition.id, game_id: game.id, name: "Johh")
      expect(response).to redirect_to "/competitions/#{competition.id}/games/#{game.id}/players/#{player.id}"
    end

    it "Creates a player" do
      competition = Competition.create(name: "Africa Cup of Nations")
      game = Game.create(name: "Dean's game", competition_id: competition.id)
      post :create, params: { player: {name: "John"}, game_id: game.id }
      expect(Player.find_by(game_id: game.id, name: "John")).to be 
    end

  end

  describe '#create' do
    it 'assigns a valid team to the player' do 
      competition = Competition.create(name: "Africa Cup of Nations")
      game = Game.create(name: "Dean's game", competition_id: competition.id)
      post :create, params: { player: {name: "John"}, game_id: game.id, team_id: 1 }
      expect(Player.find_by(game_id: game.id, name: "John", team_id: 1)).to be 
    end
  end
end
