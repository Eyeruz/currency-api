class CurrencyHistoriesController < ApplicationController
  before_action :set_currency_history, only: [:show, :update, :destroy]

  # GET /currency_histories
  def index
    # binding.pry
    if params[:user_id]
      user = User.find_by_id(params[:user_id])
      @currency_histories = user.currency_histories
      else
    @currency_histories = CurrencyHistory.all
      end
    render json: @currency_histories
  end

  # GET /currency_histories/1
  def show
    render json: @currency_history
  end

  # POST /currency_histories
  def create
    if params[:user_id]
      user = User.find_by_id(params[:user_id])
      @currency_history = user.currency_histories.build(currency_history_params)
if @currency_history.save
      render json: @currency_history, status: :created, location: @currency_history
    else
      render json: @currency_history.errors, status: :unprocessable_entity
    end
  end
end


  # PATCH/PUT /currency_histories/1
  def update
    if @currency_history.update(currency_history_params)
      render json: @currency_history
    else
      render json: @currency_history.errors, status: :unprocessable_entity
    end
  end


  # DELETE /currency_histories/1
  def destroy
    @currency_history.destroy
    render json: {message: 'successful deletion'}

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_currency_history
      @currency_history = CurrencyHistory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def currency_history_params
      params.require(:currency_history).permit(:currencyName, :rate, :currencyAmount, :convertedName, :convertedAmount, :convertedDate)
    end
end
