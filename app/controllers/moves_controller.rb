class MovesController < ApplicationController
  def new
    @move = Move.new
    @title = 'Submit a move'
  end

  def create
    Move.create(move_params)
    redirect_to :new
  end

  private

  def move_params
    params.require(:move).permit(:super_power, :turn, :request)
  end
end
