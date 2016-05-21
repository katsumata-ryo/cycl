require 'rails_helper'

describe 'ConfigsRouting' do
  context 'no login user' do
    it 'does not works(configs#index page)' do
      begin
        get configs_path
        response.status
      rescue => e
        expect(e.class).to eq(NoMethodError)
      end
    end
  end

  context 'login user' do
    login_user(User.first)

    it 'works(configs#index page)' do
      get configs_path
      expect(response.status).to eq(200)
    end
  end
end