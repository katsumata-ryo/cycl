class SalaryDate < ActiveRecord::Base
  # relation
  belongs_to :user

  # validation
  validates :cutoff, inclusion: { in: [1, 10, 15, 31] }
end
