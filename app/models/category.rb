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
  validates_presence_of :name
  validates_numericality_of :budget
  validates :budget, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :monthly, inclusion: { in: [true, false] }

  # Scopes
  scope :_own, lambda { where( user_id: first.user_id) }

  def self.create_first(user_id)
    default_records = [
      { name: "食費", monthly: false, budget: 20000, user_id: user_id },
      { name: "交際費", monthly: false, budget: 30000, user_id: user_id },
      { name: "家賃", monthly: true, budget: 60000, user_id: user_id },
      { name: "光熱費", monthly: true, budget: 5000, user_id: user_id },
      { name: "携帯代", monthly: true, budget: 7000, user_id: user_id },
      { name: "貯金", monthly: true, budget: 20000, user_id: user_id },
    ]
    Category.create(default_records)
  end
end
