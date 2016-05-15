class Summary::MonthsController < SummaryController
  def show
    month = Date.new(params[:year].to_i, params[:month].to_i, 1)
    @month_records = @records._month(month)
    @incomes            = @month_records._incomes
    @payments           = @month_records._payments
    @card_sum           = @month_records.where(card: true).sum(:money)
    @categories         = @user.categories
  end
end
