# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  monthly    :boolean
#  budget     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Category < ActiveRecord::Base
  # relation
  has_many :records
  belongs_to :user

  # validation
  validates_presence_of :name, :user_id, :is_payment
  validates :budget, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :monthly, inclusion: { in: [true, false] }
end
