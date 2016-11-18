class GamesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]

  def new
    @game = Game.new
  end

  def create
    @game = current_user.games.build(game_params)
    if @game.save
      flash[:success] = "Game created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

  def game_params
    params.require(:game).permit(:location, :win)
  end
end