class HomeController < ApplicationController

    def index
      @latest_boards = Board.order(created_at: :desc).limit(3)
      @latest_teams = Team.order(created_at: :desc).limit(3)
      @latest_users = User.order(created_at: :desc).limit(3)
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
  