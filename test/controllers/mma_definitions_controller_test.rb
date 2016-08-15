require 'test_helper'

class MmaDefinitionsControllerTest < ActionController::TestCase
  setup do
    @mma_definition = mma_definitions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mma_definitions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mma_definition" do
    assert_difference('MmaDefinition.count') do
      post :create, mma_definition: { name: @mma_definition.name }
    end

    assert_redirected_to mma_definition_path(assigns(:mma_definition))
  end

  test "should show mma_definition" do
    get :show, id: @mma_definition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mma_definition
    assert_response :success
  end

  test "should update mma_definition" do
    patch :update, id: @mma_definition, mma_definition: { name: @mma_definition.name }
    assert_redirected_to mma_definition_path(assigns(:mma_definition))
  end

  test "should destroy mma_definition" do
    assert_difference('MmaDefinition.count', -1) do
      delete :destroy, id: @mma_definition
    end

    assert_redirected_to mma_definitions_path
  end
end
