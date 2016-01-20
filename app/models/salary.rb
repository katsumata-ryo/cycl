class Salary < ActiveRecord::Base
  # relation
  belongs_to :user

  # validation
  validates_presence_of :year, :money
  validates :money, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :year, format: { with: /\A(19|20)\d{2}\Z/ }

  # Scopes
  scope :_year, lambda { |y| where(year: y) }
  scope :_own, lambda {
    today = Date.today
    if today.month.to_i < 4
      where(year: today.prev_year.year)
    else
      where(year: today.year)
    end
  }

  def self.create_first(user_id)
    default_records = [
      { year: 2015, money: 180000, user_id: user_id },
      { year: 2016, money: 200000, user_id: user_id },
    ]
    Salary.create(default_records)
  end
end
