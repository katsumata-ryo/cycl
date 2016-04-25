class SummaryController < ApplicationController
  # devise
  before_action :authenticate_user!
  before_action :set_own_categories, :set_records

  def index
    @month_records = @records
    @sum           = @month_records.sum(:money)
    @card_sum      = @month_records.where(card: true).sum(:money)
    @categories    = @user.categories
  end

  def show
    @sum    = @records
  end

  private

  def set_records
    @records = @user.records
  end

  def set_own_categories
    @categories = @user.categories._own
  end
end
