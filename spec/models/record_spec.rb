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
      record.card        = false
      record.memo        = "test"
      record.save
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
    end

    context "error case." do
      it "is invalid payment value" do
        ["test", nil].each do |value|
          @record.payment = value
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
