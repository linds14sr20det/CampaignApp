class GamesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]

  def index
    @games = Game.paginate(page: params[:page])
    @armies = Army.all
  end

  def new
    @game = Game.new
    @armies = Army.all
    @locations = Location.all
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
    params.require(:game).permit(:location_id, :win, :user_army_id, :opponent_army_id)
  end
end