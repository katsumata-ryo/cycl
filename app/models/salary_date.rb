class SalaryDate < ActiveRecord::Base
  # Relations
  belongs_to :user

  # Validations
  validates :cutoff, inclusion: { in: [1, 10, 15, 31] }
  validates :user_id,  uniqueness: true

  def period(year, month)
    this_salary_date = Date.new(year, month, cutoff)
    {
      :from  => this_salary_date,
      :to    => (this_salary_date.next_month - 1)
    }
  end

  def self.create_first(user_id)
    default_records = [
      { cutoff: 10, user_id: user_id },
    ]
    SalaryDate.create(default_records)
  end
end
