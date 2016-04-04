class SummaryController < ApplicationController
  # devise
  before_action :authenticate_user!
  before_action :set_own_categories, :set_own_salary, :set_records

  def index
    @month_records = @records.where(date: this_month_range(Date.today))
    @sum           = @month_records.sum(:payment)
    @card_sum      = @month_records.where(card: true).sum(:payment)
    @categories    = @user.categories
  end

  def show
    @sum    = @records
    @salary = @user.salaries.find_by(:enable).first
  end

  private

  # Todo: RecordControllerと重複、あとで別クラスのモデルへ
  def this_month_range(date)
    @date        = date
    @salary_date = 10

    from_date...to_date
  end

  def from_date
    if @date.day >= @salary_date
      Date.new(@date.year, @date.month, @salary_date)
    else
      Date.new(@date.last_month.year, @date.last_month.month, @salary_date)
    end
  end

  def to_date
    if @date.day >= @salary_date
      Date.new(@date.next_month.year, @date.next_month.month, @salary_date)
    else
      Date.new(@date.year, @date.month, @salary_date)
    end
  end

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
