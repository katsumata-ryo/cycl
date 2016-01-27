# == Schema Information
#
# Table name: records
#
#  id          :integer          not null, primary key
#  payment     :integer
#  date        :date
#  card        :boolean
#  memo        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  user_id     :integer
#

require 'rails_helper'

describe Record do
  describe "test" do
    before do
      record             = Record.new
      record.payment     = 0
      record.date        = Date.today
      record.category_id = 1
      record.user_id     = 1
      record.card        = false
      record.memo        = "test"
      record.save!
      @record = Record.first
    end

    context "normal case." do
      it "not null" do
        expect(@record.payment).not_to be_nil
      end

      it "card is require boolean" do
        expect(@record.card).to match(true).or match(false)
        expect(@record.save).to be_truthy
      end

      it "can save normal payment value" do
        [0, -1, 1, 10000, 300, 11].each do |value|
          @record.payment = value
          expect(@record.save).to be_truthy
        end
      end

      it "can save normal date value" do
        [[2000, 2, 2], [2011, 12, 12], [2020, 2, 2]].each do |value|
          @record.date = Date.new(value[0], value[1], value[2])
          expect(@record.save).to be_truthy
        end
      end

      it "can save normal card value" do
        [true, false].each do |value|
          @record.card = value
          expect(@record.save).to be_truthy
        end
      end

      it "can save normal memo value" do
        ["大丈夫だ", "問題ない", ""].each do |value|
          @record.memo = value
          expect(@record.save).to be_truthy
        end
      end

      it "can save normal category_id value" do
        [1, 10, 100].each do |value|
          @record.category_id = value
          expect(@record.save).to be_truthy
        end
      end

      it "can save normal user_id value" do
        [1, 10, 100].each do |value|
          @record.user_id = value
          expect(@record.save).to be_truthy
        end
      end
    end

    context "error case." do
      it "can not save invalid payment value" do
        [nil, true, "", "string", 1.08].each do |value|
          @record.payment = value
          expect(@record.save).to be_falsey
        end
      end

      it "can not save invalid date value" do
        [nil, "", "string"].each do |value|
          @record.date = value
          expect(@record.save).to be_falsey
        end
      end

      it "can not save invalid card value" do
        [nil, ""].each do |value|
          @record.card = value
          expect(@record.save).to be_falsey
        end
      end

      it "can not save invalid user_id value" do
        [nil, "", true].each do |value|
          @record.user_id = value
          expect(@record.save).to be_falsey
        end
      end

      it "can not save invalid category_id value" do
        [nil, "", true].each do |value|
          @record.category_id = value
          expect(@record.save).to be_falsey
        end
      end
    end
  end
end
