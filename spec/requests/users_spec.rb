require 'rails_helper'

describe 'UsersRouting' do
  context 'no login user' do
    it 'works(sign_in page)' do
      get new_user_session_path
      expect(response.status).to eq(200)
    end

    it 'works(sign_up page)' do
      get new_user_registration_path
      expect(response.status).to eq(200)
    end

    it 'does not works and redirect on sign_out' do
      delete destroy_user_session_path
      expect(response.status).to eq(302)
    end
  end

  context 'login user' do
    login_user(User.first)

    it 'works(sign_in page)' do
      get new_user_session_path
      expect(response.status).to eq(302)
    end

    it 'works(sign_up page)' do
      get new_user_registration_path
      expect(response.status).to eq(302)
    end

    it 'works(password edit page)' do
      get edit_user_password_path
      expect(response.status).to eq(302)
    end

    it 'works(sign_out page)' do
      delete destroy_user_session_path
      expect(response.status).to eq(302)
    end
  end
end