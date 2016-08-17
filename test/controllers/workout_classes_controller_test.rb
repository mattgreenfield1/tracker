require 'test_helper'

class WorkoutClassesControllerTest < ActionController::TestCase
  setup do
    @workout_class = workout_classes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workout_classes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create workout_class" do
    assert_difference('WorkoutClass.count') do
      post :create, workout_class: { day: @workout_class.day, details: @workout_class.details, time: @workout_class.time, workout_definition_id: @workout_class.workout_definition_id }
    end

    assert_redirected_to workout_class_path(assigns(:workout_class))
  end

  test "should show workout_class" do
    get :show, id: @workout_class
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @workout_class
    assert_response :success
  end

  test "should update workout_class" do
    patch :update, id: @workout_class, workout_class: { day: @workout_class.day, details: @workout_class.details, time: @workout_class.time, workout_definition_id: @workout_class.workout_definition_id }
    assert_redirected_to workout_class_path(assigns(:workout_class))
  end

  test "should destroy workout_class" do
    assert_difference('WorkoutClass.count', -1) do
      delete :destroy, id: @workout_class
    end

    assert_redirected_to workout_classes_path
  end
end
