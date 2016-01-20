require 'rails_helper'

describe Salary do
  fixtures :salaries
  before do
    salary = salaries(:one)
    salary.save
    @salary = Salary.first
  end

  context "normal case." do
    it "can save" do
      expect(@salary.save).to be_truthy
    end

    it "can save normal year value" do
      [1985, 1999, 2010, 2015, 2020, 2030].each do |value|
        @salary.year = value
        expect(@salary.save).to be_truthy
      end
    end

    it "can save normal money value" do
      ["0", "10000"].each do |value|
        @salary.money = value
        expect(@salary.save).to be_truthy
      end
    end

    it "can save normal user_id value" do
      ["11", "102", "1003"].each do |value|
        @salary.user_id = value
        expect(@salary.save).to be_truthy
      end
    end
  end

  context "error case." do
    it "is invalid year value" do
      [1.08, 0, -1, nil, 1800, 3456, 10000].each do |value|
        @salary.year = value
        expect(@salary.save).to be_falsey
      end
    end

    it "is invalid money value" do
      [1.08, -1, nil].each do |value|
        @salary.money = value
        expect(@salary.save).to be_falsey
      end
    end

    it "is invalid user id value" do
      [nil, true, "string", "",].each do |value|
        @salary.user_id = value
        expect(@salary.save).to be_falsey
      end
    end
  end
end
