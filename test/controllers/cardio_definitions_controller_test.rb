require 'test_helper'

class CardioDefinitionsControllerTest < ActionController::TestCase
  setup do
    @cardio_definition = cardio_definitions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cardio_definitions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cardio_definition" do
    assert_difference('CardioDefinition.count') do
      post :create, cardio_definition: { name: @cardio_definition.name }
    end

    assert_redirected_to cardio_definition_path(assigns(:cardio_definition))
  end

  test "should show cardio_definition" do
    get :show, id: @cardio_definition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cardio_definition
    assert_response :success
  end

  test "should update cardio_definition" do
    patch :update, id: @cardio_definition, cardio_definition: { name: @cardio_definition.name }
    assert_redirected_to cardio_definition_path(assigns(:cardio_definition))
  end

  test "should destroy cardio_definition" do
    assert_difference('CardioDefinition.count', -1) do
      delete :destroy, id: @cardio_definition
    end

    assert_redirected_to cardio_definitions_path
  end
end
