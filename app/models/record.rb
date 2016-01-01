class Record < ActiveRecord::Base
  # validation
  validates_presence_of :payment, :category
  validates_numericality_of :payment, :greater_than_or_equal_to => 0
  validates :card, inclusion: { in: [true, false] }
end
