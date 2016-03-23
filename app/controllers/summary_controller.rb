class SummaryController < ApplicationController
  # devise
  before_action :authenticate_user!
  before_action :set_own_categories, :set_own_salary, :set_records

  def index
    @month_records = @records.where(date: Date.today.all_month)
    @sum           = @month_records.sum(:payment)
    @card_sum      = @month_records.where(card: true).sum(:payment)
    @categories    = Category.all
  end

  def show
    @sum    = @records
    @salary = @user.salaries.find_by(:enable).first
  end

  private

  def set_records
    @records = @user.records
  end

  def set_own_categories
    @categories = @user.categories._own
  end

  def set_own_salary
    if @user.salaries.find_by(enable: true).present?
      @salary = @user.salaries.find_by(enable: true)
    else
      redirect_to configs_path, notice: '有効な収入を設定してください'
    end
  end
end
