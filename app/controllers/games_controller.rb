class GamesController < ApplicationController

  def create
    @competition = Competition.find(params[:competition_id])
    @game = @competition.games.create(game_params)
    redirect_to competition_game_url(@competition.id, @game.id)
  end

  def show
    @competition = Competition.find(params[:competition_id])
    @game = Game.find(params[:id])
    @teams = Team.all.select { |team| team.competition_id == params[:competition_id].to_i }.count
    @playerswithoutteams = @teams - Player.all.select { |player| player.game_id == @game.id }.count
  end

  private

    def game_params
      params.require(:game).permit(:name)
    end

end
