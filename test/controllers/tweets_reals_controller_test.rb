require 'test_helper'

class TweetsRealsControllerTest < ActionController::TestCase
  setup do
    @tweets_real = tweets_reals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tweets_reals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tweets_real" do
    assert_difference('TweetsReal.count') do
      post :create, tweets_real: {  }
    end

    assert_redirected_to tweets_real_path(assigns(:tweets_real))
  end

  test "should show tweets_real" do
    get :show, id: @tweets_real
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tweets_real
    assert_response :success
  end

  test "should update tweets_real" do
    patch :update, id: @tweets_real, tweets_real: {  }
    assert_redirected_to tweets_real_path(assigns(:tweets_real))
  end

  test "should destroy tweets_real" do
    assert_difference('TweetsReal.count', -1) do
      delete :destroy, id: @tweets_real
    end

    assert_redirected_to tweets_reals_path
  end
end
