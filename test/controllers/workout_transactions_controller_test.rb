require 'test_helper'

class WorkoutTransactionsControllerTest < ActionController::TestCase
  setup do
    @workout_transaction = workout_transactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workout_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create workout_transaction" do
    assert_difference('WorkoutTransaction.count') do
      post :create, workout_transaction: { date: @workout_transaction.date, details: @workout_transaction.details, time: @workout_transaction.time }
    end

    assert_redirected_to workout_transaction_path(assigns(:workout_transaction))
  end

  test "should show workout_transaction" do
    get :show, id: @workout_transaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @workout_transaction
    assert_response :success
  end

  test "should update workout_transaction" do
    patch :update, id: @workout_transaction, workout_transaction: { date: @workout_transaction.date, details: @workout_transaction.details, time: @workout_transaction.time }
    assert_redirected_to workout_transaction_path(assigns(:workout_transaction))
  end

  test "should destroy workout_transaction" do
    assert_difference('WorkoutTransaction.count', -1) do
      delete :destroy, id: @workout_transaction
    end

    assert_redirected_to workout_transactions_path
  end
end
