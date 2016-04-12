class Income < ActiveRecord::Base
  # relation
  belongs_to :category
  belongs_to :user

  # validation
  validates_presence_of :income, :category_id
  validates_numericality_of :income
end
