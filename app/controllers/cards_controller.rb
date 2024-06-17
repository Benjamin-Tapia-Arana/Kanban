class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def index
    @cards = Card.all
  end

  def show
  end

  def new
    @card = Card.new
  end

  def new_team_card
    @card = Card.new
    @status_list_id = params[:status_list_id]
  end

  def create
    @card = Card.new(card_params)
    respond_to do |format|
      if @card.save
        format.html {redirect_to @card, notice: 'Tarjeta creada con éxito'}
        format.json {render :show, status: :created, location: @card}
      else
        format.html {render new_team_card_path(status_list_id: @card.status_list_id), status: :unprocessable_entity, locals: { card: @card }}
        format.json {render json: @card.errors, status: :unprocessable_entity}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html {redirect_to @card, notice: 'Tarjeta actualizada con éxito'}
        format.json {render :show, status: :created, location: @card}
      else
        format.html {render :edit, status: :unprocessable_entity, locals: { card: @card }}
        format.json {render json: @card.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @card.destroy
    redirect_to cards_path, notice: 'Tarjeta eliminada con éxito'
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:title, :description, :priority, :creator_id, :assignee_id, :status_list_id)
  end

end
