require 'test_helper'

class IncomesControllerTest < ActionController::TestCase
  test "should get income" do
    get :income
    assert_response :success
  end

  test "should get date" do
    get :date
    assert_response :success
  end

  test "should get memo" do
    get :memo
    assert_response :success
  end

  test "should get category_id" do
    get :category_id
    assert_response :success
  end

  test "should get user_id" do
    get :user_id
    assert_response :success
  end

end
