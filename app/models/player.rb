class Player < ApplicationRecord
  belongs_to :game

  validates :name, presence: true

  # before_create :check_player

  # def check_player
  #   @game = Game.find(game_id)
  #   @players = Player.all.select { |player| player.game_id == @game.id }
  #   @randomteams = Team.all.select { |team| (team.competition_id == params[:competition_id].to_i) && (@players.none? { |player| player.team_id == team.id }) }.shuffle
  # end

end
