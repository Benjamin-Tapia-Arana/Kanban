class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  def index
    @boards = Board.all
  end
    
  def show
    @status_lists = @board.status_lists.includes(:cards)
  end

  def new
    @board = Board.new
    @team_id = params[:team_id]
  end

  def create
    @board = Board.new(board_params)
    respond_to do |format|
      if @board.save
        format.html {redirect_to board_path(@board), notice: 'Tabla creada exitosamente.'}
        format.json {render :show, status: :created, location: @board}
      else
        format.html {render :new, status: :unprocessable_entity, locals: {team_id: params[:team_id]}}
        format.json {render json: @board.errors, status: :unprocessable_entity}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html {redirect_to board_path(@board), notice: 'Tabla actualizada exitosamente.'}
        format.json {render :show, status: :created, location: @board}
      else
        format.html {render :edit, status: :unprocessable_entity, locals: {team_id: params[:team_id]}}
        format.json {render json: @board.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @board.destroy
    respond_to do |format|
      format.html {redirect_to boards_path, notice: 'Tabla eliminada exitosamente.'}
      format.json {head :no_content}
    end
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:title, :creator_id, :team_id)
  end  

end