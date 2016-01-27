# == Schema Information
#
# Table name: salary_dates
#
#  id         :integer          not null, primary key
#  cutoff     :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

describe SalaryDate do
  fixtures :salary_dates
  before do
    salary_date = salary_dates(:one)
    salary_date.save
    @salary_date = SalaryDate.first
  end

  context "normal case" do
    it "can save" do
      salary_date = salary_dates(:two)
      expect(salary_date.save).to be_truthy
    end

    it "can update" do
      expect(@salary_date.update({cutoff: 10})).to be_truthy
    end

    it "can destroy" do
      expect(@salary_date.destroy).to be_truthy
    end

    it "can save normal cutoff value" do
      ["1", "10", "15", "31"].each do |value|
        @salary_date.cutoff = value
        expect(@salary_date.save).to be_truthy
      end
    end
  end

  context "error case" do
    it "is invalid cutoff value" do
      [nil, false, "", 2, "2", "-1", "32", "100000"].each do |value|
        @salary_date.cutoff = value
        expect(@salary_date.save).to be_falsey
      end
    end
  end
end
