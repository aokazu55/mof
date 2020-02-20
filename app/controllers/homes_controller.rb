class HomesController < ApplicationController
  before_action :set_home, only: [:show, :edit, :update, :destroy]

  def index
    @homes = Home.all
  end

  def show
  end

  def new
    @home = Home.new
    @home.stations.new
  end

  def edit
    @home.stations.new
  end

  def create
    @home = Home.new(home_params)
    respond_to do |format|
      if @home.save
        reset_session
        format.html { redirect_to @home, notice: 'Home was successfully created.' }
        format.json { render :show, status: :created, location: @home }
      else
        format.html { render :new }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if params[:back]
        render:edit
      else
          if @home.update(home_params)
          format.html { redirect_to @home, notice: 'Home was successfully updated.' }
          format.json { render :show, status: :ok, location: @home }
          else
          format.html { render :edit }
          format.json { render json: @home.errors, status: :unprocessable_entity }
          end
      end
    end
  end

  def destroy
    @home.destroy
    respond_to do |format|
      format.html { redirect_to homes_url, notice: 'Home was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_home
    @home = Home.find(params[:id])
  end

  def home_params
    params.require(:home).permit(:name, :rent, :address, :year, :remarks,
      stations_attributes:[:line, :station, :minute, :_destroy, :id])
  end
end
