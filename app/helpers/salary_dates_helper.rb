# == Schema Information
#
# Table name: salary_dates
#
#  id         :integer          not null, primary key
#  cutoff     :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

module SalaryDatesHelper
  def cutoff_list
    { '月初' => '1' , '10日' => '10', '15日' => '15', '月末' => '31' }
  end

  def display(cutoff)
    case cutoff
    when 1
      "月初"
    when 31
      "月末"
    else
      "#{cutoff.to_s}日"
    end
  end
end
