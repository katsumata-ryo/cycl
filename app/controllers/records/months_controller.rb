class Records::MonthsController < RecordsController
  def index
  end

  def show
    @year  = params[:year].to_i
    @month = params[:month].to_i
    date = Date.new(@year, @month, 1)

    @records = @user.records._month(date).order(date: :desc).page(params[:page]).per(10)
  end
end
