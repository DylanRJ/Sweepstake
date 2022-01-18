require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe "POST /games" do
    it "responds with 200" do
      competition = Competition.new(name: "Africa Cup of Nations")
      competition.save
      post :create, params: { game: {name: "Dean's game"}, competition_id: competition.id }
      game = Game.find_by(competition_id: competition.id, name: "Dean's game")
      expect(response).to redirect_to "/competitions/#{competition.id}/games/#{game.id}"
    end
    it "Creates a game" do
      competition = Competition.new(name: "Africa Cup of Nations")
      competition.save
      post :create, params: { game: {name: "Dean's game"}, competition_id: competition.id }
      expect(Game.find_by(competition_id: competition.id, name: "Dean's game")).to be
    end 
  end
end  
