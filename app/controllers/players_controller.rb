class PlayersController < ApplicationController

  def index
    @competition = Competition.find(params[:competition_id])
    @players = Player.all
    @game = Game.find(params[:game_id])
  end

  def new
    @game = Game.find(params[:game_id])
    @player = @game.players.new
  end

  def create
    @competition = Competition.find(params[:competition_id])
    @game = Game.find(params[:game_id])
    @players = Player.all.select { |player| player.game_id == @game.id }
    @teams = Team.all.select { |team| (team.competition_id == params[:competition_id].to_i) && (@players.none? { |player| player.team_id == team.id }) }.count
    @randomteams = Team.all.select { |team| (team.competition_id == params[:competition_id].to_i) && (@players.none? { |player| player.team_id == team.id }) }.shuffle
    i = 1
    (0...@teams).each do
      @game.players.create(name: params["player"]["name#{i}"], team_id: @randomteams[i - 1][:id])
      i += 1
    end
    redirect_to competition_game_player_url(@competition.id, @game.id, :id)
  end

  def show
    @competition = Competition.find(params[:competition_id])
    @game = Game.find(params[:game_id])
    @players = Player.all.select { |player| player.game_id == @game.id }
    @teams = Team.all.select { |team| team.competition_id == params[:competition_id].to_i }
  end

  private

  def player_params
    params.require(:player).permit(:name)
  end
  
end
