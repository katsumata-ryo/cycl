require 'rails_helper'

describe 'Home Requests' do
  fixtures :users

  context 'no login user' do
    it 'works(welcome page)' do
      get root_path
      expect(response.status).to eq(200)
    end
  end

  context 'login user' do
    login_user(User.first)

    it 'works(welcome page)' do
      get root_path
      expect(response.status).to eq(200)
    end
  end
end