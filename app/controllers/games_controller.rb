class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.create(creator: current_user)
    redirect_to @game
  end

  def show
    @game = Game.find(params.require(:id))
    @player = @game.player_from_user(current_user)
  end

  def join
    @game = Game.find(params.require(:id))
    player = @game.add_player(current_user)
    flash[:success] = "You have joined the game as #{player.super_power}."
    redirect_to game_path(@game)
  end
end
