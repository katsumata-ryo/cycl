class SummaryController < ApplicationController
  # devise
  before_action :authenticate_user!
  before_action :set_own_categories, :set_records

  def index
    today = Date.today
    @this_month_records = @records._month(today.beginning_of_month, today.end_of_month)
    @incomes            = @this_month_records._incomes
    @payments           = @this_month_records._payments
    @card_sum           = @this_month_records.where(card: true).sum(:money)
    @categories         = @user.categories
  end

  def show
    month = Date.new(params[:year].to_i, params[:month].to_i, 1)
    @month_records = @records._month(month.beginning_of_month, month.end_of_month)
    @incomes            = @month_records._incomes
    @payments           = @month_records._payments
    @card_sum           = @month_records.where(card: true).sum(:money)
    @categories         = @user.categories
  end

  private

  def set_records
    @records = @user.records
  end

  def set_own_categories
    @categories = @user.categories._own
  end
end
