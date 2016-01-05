class SummaryController < ApplicationController
  def index
    @user_records_this_month_for_category = Record.user_this_month(current_user.id).category_sums
    @user_records_this_month = Record.user_this_month(current_user.id)
    @card_this_month = Record.sum_card_for_this_month(current_user.id).sum(:payment)
    @user_categories = Category.of_user(current_user.id)
    @salary = Salary.of_user(current_user.id, Date.today.month).first
  end

  def show
    @month_records = Record.get_month_records(current_user.id, params[:year].to_i, params[:month].to_i)

    # @user_records_this_month_for_category = Record.user_this_month(current_user.id).category_sums
    # @user_records_this_month = Record.user_this_month(current_user.id)
    # @card_this_month = Record.sum_card_for_this_month(current_user.id).sum(:payment)
    @user_categories = Category.of_user(current_user.id)
    @salary = Salary.of_user(current_user.id, params[:month]).first
  end
end
