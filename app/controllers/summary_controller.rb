class SummaryController < ApplicationController
  # devise
  before_action :authenticate_user!
  before_action :set_own_categories, :set_own_salary

  def index
    today = Date.today
    period = @user.salary_date.period(today.year, today.month)

    @records_this_month              = @user.records._month(period[:from], period[:to])
    @records_this_month_for_category = @records_this_month.category_sums
    @card_this_month                     = @records_this_month._card.sum(:payment)
    @sum = @user.records._month(period[:from], period[:to]).sum(:payment)
  end

  def show
    cutoff = @user.salary_date.cutoff
    date = Date.new(params[:year].to_i, params[:month].to_i, cutoff)
    @month_records = @user.records._month(date, (date.next_month - 1))
    @salary        = @user.salaries._year(params[:year]).first
  end

  private

  def set_own_categories
    @categories = @user.categories.own
  end

  def set_own_salary
    @salary = @user.salaries._own.first
  end
end
