require 'rails_helper'

describe 'UsersRouting' do
  context 'no login' do
    it 'works(sign_in page)' do
      get new_user_session_path
      expect(response.status).to eq(200)
    end

    it 'does not works and redirect on sign_out' do
      delete destroy_user_session_path
      expect(response.status).to eq(302)
    end
  end
end