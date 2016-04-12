# == Schema Information
#
# Table name: records
#
#  id          :integer          not null, primary key
#  money     :integer
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
  validates_presence_of :money, :category_id
  validates_numericality_of :money
  validates :card, inclusion: { in: [true, false] }

  scope :_month,  lambda { |from, to| where(date: from..to) }
  scope :_card,   lambda { where(card: true) }

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
      sums[category] = self.where(category: category).sum(:money)
    end
    sums.sort
  end
end
