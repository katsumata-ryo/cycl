# == Schema Information
#
# Table name: records
#
#  id          :integer          not null, primary key
#  payment     :integer
#  date        :date
#  card        :boolean
#  memo        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  user_id     :integer
#

module RecordsHelper
  def select_month_values
    today = Date.today
    (-5..6).collect{|i| today.months_since(i)}
  end

  def this_page?(date)
    if params[:month].present?
      date.month == params[:month].to_i
    else
      date == Date.today
    end
  end
end
