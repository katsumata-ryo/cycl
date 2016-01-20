class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # relation
  has_many :records
  has_many :categories
  has_many :salaries
  has_one  :salary_date

  after_create :insert_default_record

  def insert_default_record
    user_id = self.id
    # categories
    Category.create_first(user_id)

    # salaries
    Salary.create_first(user_id)

    # salary_date
    SalaryDate.create_first(user_id)
  end
end
