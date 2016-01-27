# == Schema Information
#
# Table name: salaries
#
#  id         :integer          not null, primary key
#  year       :integer
#  money      :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SalariesControllerTest < ActionController::TestCase
  setup do
    @salary = salaries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:salaries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create salary" do
    assert_difference('Salary.count') do
      post :create, salary: { money: @salary.money, user_id: @salary.user_id, year: @salary.year }
    end

    assert_redirected_to salary_path(assigns(:salary))
  end

  test "should show salary" do
    get :show, id: @salary
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @salary
    assert_response :success
  end

  test "should update salary" do
    patch :update, id: @salary, salary: { money: @salary.money, user_id: @salary.user_id, year: @salary.year }
    assert_redirected_to salary_path(assigns(:salary))
  end

  test "should destroy salary" do
    assert_difference('Salary.count', -1) do
      delete :destroy, id: @salary
    end

    assert_redirected_to salaries_path
  end
end
