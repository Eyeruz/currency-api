class CurrenciesController < ApplicationController
  before_action :set_currency, only: [:show, :update, :destroy]

  # GET /currencies
  def index
    if params[:user_id]
    user = User.find_by_id(params[:user_id])
    @currencies = user.currencies
    else
    @currencies = Currency.all
    end
    render json: @currencies
  end

  # GET /currencies/1
  def show
    render json: @currency
  end

  # POST /currencies
  def create
    if params[:user_id]
      user = User.find_by_id(params[:user_id])
@currency = user.currencies.build(currency_params)
    if @currency.save
      render json: @currency, status: :created, location: @currency
    else
      render json: @currency.errors, status: :unprocessable_entity
    end
  end
end

  # PATCH/PUT /currencies/1
  def update
    if @currency.update(currency_params)
      render json: @currency
    else
      render json: @currency.errors, status: :unprocessable_entity
    end
  end

  # DELETE /currencies/1
  def destroy
    @currency.destroy
    render json: {message: 'successful deletion'}

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_currency
      @currency = Currency.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def currency_params
      params.require(:currency).permit(:currencyName, :rate, :currencyAmount, :convertedName, :convertedAmount)
    end
end

