class SalaryDate < ActiveRecord::Base
  # relation
  belongs_to :user

  # validation
  validates :cutoff, inclusion: { in: [1, 10, 15, 31] }
  validates :user_id,  uniqueness: true

  def self.of_user(user_id)
    SalaryDate.where("user_id = #{user_id}").first
  end

  def self.user_cutoff(user_id)
    salary_date = SalaryDate.where("user_id = #{user_id}").first
    salary_date.cutoff
  end
end
