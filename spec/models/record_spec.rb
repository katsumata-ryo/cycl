# == Schema Information
#
# Table name: records
#
#  id          :integer          not null, primary key
#  money       :integer
#  date        :date
#  card        :boolean
#  memo        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  user_id     :integer
#

require 'rails_helper'

# Relations
describe Record do
  fixtures :categories
  fixtures :users

  before do
    user = users(:user_01)
    user.save
    category = categories(:category_01)
    category.save

    record             = Record.new
    record.money       = 0
    record.date        = Date.today
    record.category_id = category.id
    record.user_id     = user.id
    record.card        = false
    record.memo        = "test"
    record.save
    @record = Record.first
  end

  describe 'Relations' do
    it 'belongs_to category' do
      expect(@record.category).to be_truthy
    end

    it 'belongs to user' do
      expect(@record.user).to be_truthy
    end
  end

  # Validations

  # Methods
  describe "test" do
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
