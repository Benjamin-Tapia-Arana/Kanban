class TuLinkersController < ApplicationController
    before_action :set_user_team, only: [:show, :edit, :update, :destroy]
    before_action :set_team, only: [:index]

    def index
        @team_user_ids = @team.tu_linker_ids
    end

    def show
    end

    def new
        @tu_linker = TuLinker.new
        @team_id = params[:team_id]
    end

    def create
        @tu_linker = TuLinker.new(tu_linker_params)
        respond_to do |format|
            if @tu_linker.save
                format.html {redirect_to team_path(@tu_linker.team_id), notice: 'Usuario agregado exitosamente al equipo.'}
                format.json {render :show, status: :created, location: @tu_linker}
            else
                format.html {render :new, status: :unprocessable_entity, locals: {team_id: params[:team_id]}}
                format.json {render json: @tu_linker.errors, status: :unprocessable_entity}
            end
        end
    end

    def edit
    end

    def update
    end

    def destroy
        @tu_linker.destroy
        respond_to do |format|
            format.html {redirect_to team_path(@tu_linker.team_id), notice: 'Usuario eliminado exitosamente del equipo.'}
            format.json {head :no_content}
        end
    end

    private

    def tu_linker_params
        params.require(:tu_linker).permit(:team_id, :user_id)
    end

    def set_user_team
        @tu_linker = TuLinker.find(params[:id])
    end

    def set_team
        @team = Team.find(params[:team_id])
    end

end
