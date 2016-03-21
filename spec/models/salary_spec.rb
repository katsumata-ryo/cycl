# == Schema Information
#
# Table name: salaries
#
#  id         :integer          not null, primary key
#  year       :integer
#  money      :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

# describe Salary do
#   fixtures :salaries
#   before do
#     salary = salaries(:one)
#     salary.save
#     @salary = Salary.first
#   end

#   context "normal case." do
#     it "can save" do
#       expect(@salary.save).to be_truthy
#     end

#     it "can save normal year value" do
#       values = [1985, 1999, 2010, 2015, 2020, 2030]
#       p
#       values.each do |value|
#         @salary.year = value
#         expect(@salary.save).to be_truthy
#       end
#     end

#     it "can save normal money value" do
#       values = ["0", "10000"]
#       values.each do |value|
#         @salary.money = value
#         expect(@salary.save).to be_truthy
#       end
#     end
#   end

#   context "error case." do
#     it "is invalid year value" do
#       [1.08, 0, -1, nil, 1800, 3456, 10000].each do |value|
#         @salary.year = value
#         expect(@salary.save).to be_falsey
#       end
#     end

#     it "is invalid money value" do
#       [1.08, -1, nil].each do |value|
#         @salary.money = value
#         expect(@salary.save).to be_falsey
#       end
#     end
#   end
# end
