class Salary < ActiveRecord::Base
  # relation
  belongs_to :user

  # validation
  validates_uniqueness_of :year
  validates_presence_of :year, :money
  validates :money, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :year, format: { with: /\A(19|20)\d{2}\Z/ }
end
