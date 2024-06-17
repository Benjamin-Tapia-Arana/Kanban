class AllBoardsController < ApplicationController

  def index
    @boards = Board.all
    @teams = Team.all
    @users = User.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
