class SummaryController < ApplicationController
  # devise
  before_action :authenticate_user!
  before_action :set_own_categories, :set_records

  def index
    today = Date.today
    @this_month_records = @records._month(today.beginning_of_month)
    @incomes            = @this_month_records._incomes
    @payments           = @this_month_records._payments
    @card_sum           = @this_month_records.where(card: true).sum(:money)
    @categories         = @user.categories
  end

  private

  def set_records
    @records = @user.records
  end

  def set_own_categories
    @categories = @user.categories
  end
end
