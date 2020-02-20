class HomesController < ApplicationController
  before_action :set_home, only: %i(show edit update destroy)

  def index
    @homes = Home.all
  end

  def new
    @home = Home.new
    @home.stations.build
  end

  def create
    @home = Home.new(home_params)
    if params[:back]
      render :new # これがないと、create.html.erbを表示しようとする
    else
      if @home.save
        redirect_to homes_path,  notice:"登録しました!！"
      else
        render :new
      end
    end
  end

  def show
  end

  def edit
    if @home.stations.last.minute.blank? &&
       @home.stations.last.line.blank? &&
       @home.stations.last.station.blank?
    else
       @home.stations.build
    end
  end

  def update
    if @home.update(home_params)
      redirect_to homes_path, notice:"編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @home.destroy
    redirect_to homes_path, notice:"削除しました！"
  end

  private

  def set_home
    @home  = Home.find(params[:id])
  end

  def home_params
    params.require(:home).permit(:name, :rent, :address, :year, :remarks,
                                  stations_attributes: %i(id line station minute house_id))
  end

end
