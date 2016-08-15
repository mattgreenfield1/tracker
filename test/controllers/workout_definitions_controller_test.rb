require 'test_helper'

class WorkoutDefinitionsControllerTest < ActionController::TestCase
  setup do
    @workout_definition = workout_definitions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:workout_definitions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create workout_definition" do
    assert_difference('WorkoutDefinition.count') do
      post :create, workout_definition: { name: @workout_definition.name, type: @workout_definition.type }
    end

    assert_redirected_to workout_definition_path(assigns(:workout_definition))
  end

  test "should show workout_definition" do
    get :show, id: @workout_definition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @workout_definition
    assert_response :success
  end

  test "should update workout_definition" do
    patch :update, id: @workout_definition, workout_definition: { name: @workout_definition.name, type: @workout_definition.type }
    assert_redirected_to workout_definition_path(assigns(:workout_definition))
  end

  test "should destroy workout_definition" do
    assert_difference('WorkoutDefinition.count', -1) do
      delete :destroy, id: @workout_definition
    end

    assert_redirected_to workout_definitions_path
  end
end
