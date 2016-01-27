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

class Record < ActiveRecord::Base
  # relation
  belongs_to :category
  belongs_to :user

  # validation
  validates_presence_of :payment, :category_id
  validates_numericality_of :payment
  validates :card, inclusion: { in: [true, false] }

  scope :_latest, lambda { order(:updated_at).reverse_order.limit(15) }
  scope :_month,  lambda { |from, to| where(date: from..to) }
  scope :_card,   lambda { where(card: true) }

  def month_records(year, month)
    user = self.first.user
    period = user.salary_date.period(year, month)
    where(date: period[:from]..period[:to])
  end

  def self.this_month
    today = Date.today
    { year: today.year, month: today.month}
  end

  def this_month_records
    today = Date.today
    month_records(today.year, today.month)
  end

  def self.category_sums
    sums = {}
    self.pluck(:category_id).each do |category|
      sums[category] = self.where(category: category).sum(:payment)
    end
    sums.sort
  end
end
