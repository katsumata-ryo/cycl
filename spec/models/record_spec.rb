# == Schema Information
#
# Table name: records
#
#  id          :integer          not null, primary key
#  money     :integer
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
      record.money     = 0
      record.date        = Date.today
      record.category_id = 1
      record.card        = false
      record.memo        = "test"
      record.save
      @record = Record.first
    end

    context "normal case." do
      it "not null" do
        expect(@record.money).not_to be_nil
      end

      it "card is require boolean" do
        expect(@record.card).to match(true).or match(false)
        expect(@record.save).to be_truthy
      end
    end

    context "error case." do
      it "is invalid money value" do
        ["test", nil].each do |value|
          @record.money = value
          expect(@record.save).to be_falsey
        end
      end

      it "empty category value is invalid" do
        @record.category = nil
        expect(@record.save).to be_falsey
      end
    end
  end
end
