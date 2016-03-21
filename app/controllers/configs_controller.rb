class ConfigsController < ApplicationController
  before_action :set_salaries, :set_salary_date, :set_categories

  def index
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def set_categories
    @categories = Category.where(user_id: current_user.id)
  end

  def set_salaries
    @salaries = Salary.where(user_id: current_user.id).order(year: :desc)
  end

  def set_salary_date
    @salary_date = SalaryDate.where(user_id: current_user.id)
  end
end
