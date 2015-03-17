require 'test_helper'

class TlistsControllerTest < ActionController::TestCase
  setup do
    @tlist = tlists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tlists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tlist" do
    assert_difference('Tlist.count') do
      post :create, tlist: { title: @tlist.title }
    end

    assert_redirected_to tlist_path(assigns(:tlist))
  end

  test "should show tlist" do
    get :show, id: @tlist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tlist
    assert_response :success
  end

  test "should update tlist" do
    patch :update, id: @tlist, tlist: { title: @tlist.title }
    assert_redirected_to tlist_path(assigns(:tlist))
  end

  test "should destroy tlist" do
    assert_difference('Tlist.count', -1) do
      delete :destroy, id: @tlist
    end

    assert_redirected_to tlists_path
  end
end
