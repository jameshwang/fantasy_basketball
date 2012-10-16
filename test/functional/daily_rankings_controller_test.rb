require 'test_helper'

class DailyRankingsControllerTest < ActionController::TestCase
  setup do
    @daily_ranking = daily_rankings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:daily_rankings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create daily_ranking" do
    assert_difference('DailyRanking.count') do
      post :create, :daily_ranking => @daily_ranking.attributes
    end

    assert_redirected_to daily_ranking_path(assigns(:daily_ranking))
  end

  test "should show daily_ranking" do
    get :show, :id => @daily_ranking.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @daily_ranking.to_param
    assert_response :success
  end

  test "should update daily_ranking" do
    put :update, :id => @daily_ranking.to_param, :daily_ranking => @daily_ranking.attributes
    assert_redirected_to daily_ranking_path(assigns(:daily_ranking))
  end

  test "should destroy daily_ranking" do
    assert_difference('DailyRanking.count', -1) do
      delete :destroy, :id => @daily_ranking.to_param
    end

    assert_redirected_to daily_rankings_path
  end
end
