class StatusListsController < ApplicationController
  before_action :set_status_list, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @status_list = StatusList.new
    @board_id = params[:board_id]
  end

  def create
    @status_list = StatusList.new(status_list_params)
    respond_to do |format|
      if @status_list.save
        format.html {redirect_to board_path(@status_list.board_id), notice: 'Lista de estado creada exitosamente.'}
        format.json {render :show, status: :created, location: @status_list}
      else
        format.html {render :new, status: :unprocessable_entity, locals: {board_id: params[:board_id]}}
        format.json {render json: @status_list.errors, status: :unprocessable_entity}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @status_list.update(status_list_params)
        format.html {redirect_to board_path(@status_list.board_id), notice: 'Lista de estado actualizada exitosamente.'}
        format.json {render :show, status: :created, location: @status_list}
      else
        format.html {render :edit, status: :unprocessable_entity, locals: {board_id: params[:board_id]}}
        format.json {render json: @status_list.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @status_list.destroy
    respond_to do |format|
      format.html {redirect_to board_path(@status_list.board_id), notice: 'Lista de estado eliminada exitosamente.'}
      format.json {head :no_content}
    end
  end

  private

  def set_status_list
    @status_list = StatusList.find(params[:id])
  end

  def status_list_params
    params.require(:status_list).permit(:title, :board_id)
  end

end
