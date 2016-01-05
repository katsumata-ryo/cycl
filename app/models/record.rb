class Record < ActiveRecord::Base
  # relation
  belongs_to :category
  belongs_to :user

  # validation
  validates_presence_of :payment, :category_id
  validates_numericality_of :payment, :greater_than_or_equal_to => 0
  validates :card, inclusion: { in: [true, false] }

  def self.of_user(user_id)
    Record.where("user_id = #{user_id}")
  end

  def self.user_this_month(user_id)
    cutoff_day = SalaryDate.user_cutoff(user_id)
    today      = Date.today
    if today.day < 10
      next_month_day = today
      today          = today.last_month
    else
      next_month_day = today.next_month
      today          = today
    end

    from = Date.new(today.year, today.month, cutoff_day)
    to   = Date.new(next_month_day.year, next_month_day.month, cutoff_day)

    Record.of_user(user_id).where(date: from..to)
  end

  def self.category_sums
    sums = {}
    self.pluck(:category_id).each do |category|
      sums[category] = self.where(category: category).sum(:payment)
    end
    sums.sort
  end

  def self.sum_card_for_this_month(user_id)
    Record.user_this_month(user_id).where(card: true)
  end
end
