# == Schema Information
#
# Table name: records
#
#  id          :integer          not null, primary key
#  money    :integer
#  date        :date
#  card        :boolean
#  memo        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  user_id     :integer
#

class Record < ActiveRecord::Base
  # Relations
  belongs_to :category
  belongs_to :user

  # Validations
  validates_presence_of :money, :category_id, :user_id
  validates_numericality_of :money, only_integer: true, greater_than_or_equal_to: 0
  validates_inclusion_of :card, in: [true, false]
  validates_date :date

  scope :_month,  lambda { |month| where(date: month..month.end_of_month) }
  scope :_card,   lambda { where(card: true) }
  scope :_payments, -> { joins(:category).where(categories: { is_payment: true}) }
  scope :_incomes, -> { joins(:category).where(categories: { is_payment: false}) }

  def self.category_sums
    sums = {}
    self.pluck(:category_id).each do |category|
      sums[category] = self.where(category: category).sum(:money)
    end
    sums.sort
  end
end
