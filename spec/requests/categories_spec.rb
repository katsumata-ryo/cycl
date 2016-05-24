require 'rails_helper'

describe 'CategoriesRouting' do
  context 'no login user' do
    it 'does not works(categories#edit page)' do
      get '/categories/1/edit'
      expect(response.status).to eq(302)
    end
  end

  context 'login user' do
    login_user(User.first)

    it 'works(categories#edit page)' do
      get '/categories/1/edit'
      expect(response.status).to eq(200)
    end
  end
end