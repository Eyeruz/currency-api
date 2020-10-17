require 'test_helper'

class CurrencyHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @currency_history = currency_histories(:one)
  end

  test "should get index" do
    get currency_histories_url, as: :json
    assert_response :success
  end

  test "should create currency_history" do
    assert_difference('CurrencyHistory.count') do
      post currency_histories_url, params: { currency_history: { date: @currency_history.date, from: @currency_history.from, to: @currency_history.to, value: @currency_history.value } }, as: :json
    end

    assert_response 201
  end

  test "should show currency_history" do
    get currency_history_url(@currency_history), as: :json
    assert_response :success
  end

  test "should update currency_history" do
    patch currency_history_url(@currency_history), params: { currency_history: { date: @currency_history.date, from: @currency_history.from, to: @currency_history.to, value: @currency_history.value } }, as: :json
    assert_response 200
  end

  test "should destroy currency_history" do
    assert_difference('CurrencyHistory.count', -1) do
      delete currency_history_url(@currency_history), as: :json
    end

    assert_response 204
  end
end
