require 'test_helper'

class WeightliftingDefinitionsControllerTest < ActionController::TestCase
  setup do
    @weightlifting_definition = weightlifting_definitions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weightlifting_definitions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create weightlifting_definition" do
    assert_difference('WeightliftingDefinition.count') do
      post :create, weightlifting_definition: { name: @weightlifting_definition.name }
    end

    assert_redirected_to weightlifting_definition_path(assigns(:weightlifting_definition))
  end

  test "should show weightlifting_definition" do
    get :show, id: @weightlifting_definition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @weightlifting_definition
    assert_response :success
  end

  test "should update weightlifting_definition" do
    patch :update, id: @weightlifting_definition, weightlifting_definition: { name: @weightlifting_definition.name }
    assert_redirected_to weightlifting_definition_path(assigns(:weightlifting_definition))
  end

  test "should destroy weightlifting_definition" do
    assert_difference('WeightliftingDefinition.count', -1) do
      delete :destroy, id: @weightlifting_definition
    end

    assert_redirected_to weightlifting_definitions_path
  end
end
