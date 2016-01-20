require 'rails_helper'

describe Category do
  fixtures :categories
  before do
    category = categories(:one)
    category.save
    @category = Category.first
  end

  context "normal case" do
    it "can save" do
      expect(@category.save).to be_truthy
    end

    it "can save normal name value" do
      values = ["食費", "eating", "10000"]
      values.each do |value|
        @category.name = value
        expect(@category.save).to be_truthy
      end
    end

    it "can save normal monthly value" do
      values = [true, false]
      values.each do |value|
        @category.monthly = value
        expect(@category.save).to be_truthy
      end
    end

    it "can save normal budget value" do
      values = [0, 1, 10000, 100000000]
      values.each do |value|
        @category.budget = value
        expect(@category.save).to be_truthy
      end
    end
  end

  context "error case" do
    it "can not save invalid name value" do
      [nil, ""].each do |value|
        @category.name = value
        expect(@category.save).to be_falsey
      end
    end

    it "can not save invalid monthly value" do
      [nil, ""].each do |value|
        @category.monthly = value
        expect(@category.save).to be_falsey
      end
    end

    it "can not save invalid budget value" do
      [nil, true, "string", "", 1.08, -1].each do |value|
        @category.budget = value
        expect(@category.save).to be_falsey
      end
    end

    it "can not save incvalid user_id value" do
      [nil, true, "string", ""].each do |value|
        @category.user_id = value
        expect(@category.save).to be_falsey
      end
    end
  end
end