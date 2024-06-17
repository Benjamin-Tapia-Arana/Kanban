class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    respond_to do |format|
      if @team.save
        format.html {redirect_to boards_path, notice: 'Equipo creado exitosamente.'}
        format.json {render :show, status: :created, location: boards_path}
      else
        format.html {render :new, status: :unprocessable_entity}
        format.json {render json: @team.errors, status: :unprocessable_entity}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html {redirect_to boards_path, notice: 'Equipo actualiza exitosamente.'}
        format.json {render :show, status: :created, location: boards_path}
      else
        format.html {render :new, status: :unprocessable_entity}
        format.json {render json: @team.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @team.destroy
    redirect_to boards_path, :notice => 'Equipo eliminado exitosamente.'
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :creator_id)
  end

end

