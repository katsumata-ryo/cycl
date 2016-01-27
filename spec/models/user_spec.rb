# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'rails_helper'

describe User do
  fixtures :users
  before do
    user = users(:one)
    user.save
    @user = User.first
  end

  context "normal case." do
    it "can save." do
      expect(@user.save).to be_truthy
    end

    it "can update." do
      expect(@user.update({email: "update@workapart.org"})).to be_truthy
    end

    it "can destroy." do
      expect(@user.destroy).to be_truthy
    end

    it "can save normal email value" do
      [
        "ryo@workapart.org",
        "1234567890abcdefghijklmnopqrstuwxyz@1234567890abcdefghijklmnopqrstuwxyz.com",
        "abc@def.jp",
      ].each do |value|
        @user.email = value
        expect(@user.save).to be_truthy
      end
    end

    it "can save normal password value" do
      [
        "ryo@workapart.org",
        "1234567890abcdefghijklmnopqrstuwxyz@1234567890abcdefghijklmnopqrstuwxyz.com",
        "abc@def.jp",
      ].each do |value|
        @user.email = value
        expect(@user.save).to be_truthy
      end
    end

    it "can save normal password value" do
      ["12345678", "abcdefgh", "_-_-_-_-", "1g_darg.;"].each do |value|
        @user.password = value
        expect(@user.save).to be_truthy
      end
    end
  end

  context "error_case." do
    it "is invalid email value" do
      [nil, "", 0, false, "1234567", "abc.def.jp", "abc.def@a" ].each do |value|
        @user.email = value
        expect(@user.save).to be_falsey
      end
    end

    it "is invalid password value" do
      [nil, "", 0, false, "1234567" ].each do |value|
        @user.email = value
        expect(@user.save).to be_falsey
      end
    end
  end
end
