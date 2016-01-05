class Salary < ActiveRecord::Base
  # relation
  belongs_to :user

  # validation
  validates_uniqueness_of :year
  validates_presence_of :year, :money
  validates :money, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :year, format: { with: /\A(19|20)\d{2}\Z/ }

  def self.of_year(user_id, year)
    Salary.where(user_id: user_id).where(year: year)
  end

  def self.of_user(user_id, month)
    today = Date.today
    if month.to_i < 4
      self.of_year(user_id, today.prev_year.year)
    else
      self.of_year(user_id, today.year)
    end
  end
end
