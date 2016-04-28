class Records::MonthsController < RecordsController
  def index
  end

  def show
    @year  = params[:year_id].to_i
    @month = params[:id].to_i
    date = Date.new(@year, @month, 10)

    @records = @user.records.where(date: this_month_range(date)).order(date: :desc).page(params[:page]).per(10)
  end
end
