require 'rails_helper'

describe 'SummaryRouting' do
  context 'no login user' do
    it 'does not works(summary#index page)' do
      begin
        get summary_path
        response.status
      rescue => e
        expect(e.class).to eq(NoMethodError)
      end
    end
  end

  context 'login user' do
    login_user(User.first)

    it 'works(summary#index page)' do
      get summary_path
      expect(response.status).to eq(200)
    end
  end
end