require 'test_helper'

class SalaryDatesControllerTest < ActionController::TestCase
  setup do
    @salary_date = salary_dates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:salary_dates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create salary_date" do
    assert_difference('SalaryDate.count') do
      post :create, salary_date: { cutoff: @salary_date.cutoff, user_id: @salary_date.user_id }
    end

    assert_redirected_to salary_date_path(assigns(:salary_date))
  end

  test "should show salary_date" do
    get :show, id: @salary_date
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @salary_date
    assert_response :success
  end

  test "should update salary_date" do
    patch :update, id: @salary_date, salary_date: { cutoff: @salary_date.cutoff, user_id: @salary_date.user_id }
    assert_redirected_to salary_date_path(assigns(:salary_date))
  end

  test "should destroy salary_date" do
    assert_difference('SalaryDate.count', -1) do
      delete :destroy, id: @salary_date
    end

    assert_redirected_to salary_dates_path
  end
end
