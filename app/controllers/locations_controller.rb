class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  before_action :admin_user,   only: [:destroy, :edit, :update]

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
    @locations.each do |location|
      total = location.games.sum(:game_score) #this should be the sum of the gamescore rows for this location
      if total > 1
        all_army_stats = {}
        location.games.each do |game|
          winning_army_id = game.win ? game.user_army_id : game.opponent_army_id
          all_army_stats[Army.find(winning_army_id).color] = (all_army_stats[Army.find(winning_army_id).name].to_i + game.game_score) #this needs to be gamescore, not just an increment
        end
        kvp = all_army_stats.max_by{ |k,v| v }
        kvp[1] = kvp[1]/(total*2.00)
      else
        kvp = ['a0a0a0', 0.2]
      end
      location.controlling_army = kvp
    end
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @games = @location.games.where('game_score > 0').order('created_at DESC').paginate(page: params[:page], :per_page => 12)
    @armies = Army.all
    @total = @location.games.sum(:game_score) #this should be the sum of the gamescore rows for this location
    @army_stats = {}
    @location.games.each do |game|
      winning_army_id = game.win ? game.user_army_id : game.opponent_army_id
      @army_stats[Army.find(winning_army_id).name] = @army_stats[Army.find(winning_army_id).name].to_i + game.game_score #this needs to be gamescore, not just an increment
    end

  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:name)
    end
end
