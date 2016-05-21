require 'rails_helper'

describe 'RecordsRouting' do
  context 'no login user' do
    it 'does not works(records#index page)' do
      begin
        get '/records/2016/1'
        response.status
      rescue => e
        expect(e.class).to eq(NoMethodError)
      end
    end
  end

  context 'login user' do
    login_user(User.first)

    it 'works(records/months#index page)' do
      get '/records/2016/1'
      expect(response.status).to eq(200)
    end

    it 'works(records/months#index page)' do
      get '/records/2015/12'
      expect(response.status).to eq(200)
    end
  end
end