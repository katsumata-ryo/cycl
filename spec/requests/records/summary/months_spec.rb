require 'rails_helper'

describe 'summaryRouting' do
  context 'no login user' do
    it 'does not works(summary#index page)' do
      begin
        get '/summary/2016/1'
        response.status
      rescue => e
        expect(e.class).to eq(NoMethodError)
      end
    end
  end

  context 'login user' do
    login_user(User.first)

    it 'works(records/months#index page)' do
      get '/summary/2016/1'
      expect(response.status).to eq(200)
    end

    it 'works(summary/months#index page)' do
      get '/summary/2015/12'
      expect(response.status).to eq(200)
    end
  end
end