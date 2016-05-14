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

require 'rails_helper'

# Relations
describe Record do
  fixtures :categories
  fixtures :users
  fixtures :records

  before do
    @records = Record.all

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
  describe "test" do
    context "normal case" do
      it "is valid money case" do
        [0, 1, 10, 100, 1000, 10000].each do |value|
          @record.money = value
          expect(@record).to be_valid
        end
      end

      it "is valid date case" do
        ['1986-12-12', '1900-1-1', '2999-12-31'].each do |value|
          @record.date = value
          expect(@record).to be_valid
        end
      end

      it "is require boolean for card" do
        expect(@record.card).to match(true).or match(false)
        expect(@record).to be_valid
      end

      it "is valid for category_id " do
        ['1', '2', '4', '100'].each do |value|
          @record.category_id = value
          expect(@record).to be_valid
        end
      end

      it "is valid for user_id value" do
        ['1', '2', '4', '100'].each do |value|
          @record.user_id = value
          expect(@record).to be_valid
        end
      end
    end

    context "error case." do
      it "is invalid money value" do
        ["test", nil, 0.1, -1, -10].each do |value|
          @record.money = value
          expect(@record).not_to be_valid
        end
      end

      it "is invalid date value" do
        ["test", nil, '2016-8-32', '2015-1-0'].each do |value|
          @record.date = value
          expect(@record).not_to be_valid
        end
      end

      it "is empty category value is invalid" do
        @record.category = nil
        expect(@record).not_to be_valid
      end
    end
  end

  # Scope
  describe 'Scopes' do
    context '_month' do
      it 'return Junuary Objects' do
        date = Date.parse('2016-01-01')
        records =  @records._month(date, date.end_of_month)
        expect(records.length).to eq(20)
      end
    end

    context '_card' do
      it 'return using card objects' do
        records = @records._card
        expect(records.length).to eq(20)
      end
    end

    context '_payments' do
      it 'return using payments objects' do
        records = @records._payments
        expect(records.length).to eq(41)
      end
    end

    context '_incomes' do
      it 'return using incomes objects' do
        records = @records._incomes
        expect(records.length).to eq(0)
      end
    end
  end

  # Methods
  describe 'methods' do
    it 'is matched sum for category_sums methods.' do
      @sums = @records.category_sums
      expect(@sums[0][1]).to eq(2000)
    end

    it 'is returned array object' do
      expect(@records.category_sums.class).to eq(Array)
    end
  end
end
