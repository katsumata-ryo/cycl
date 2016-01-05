class SummaryController < ApplicationController
  def index
    @user_records_this_month = Record.user_this_month(current_user.id).category_sums
    @user_categories = Category.of_user(current_user.id)
  end
end
