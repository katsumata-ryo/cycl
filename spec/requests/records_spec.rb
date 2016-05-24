require 'rails_helper'

describe 'RecordsRouting' do
  context 'no login user' do
    it 'does not works(records#index page)' do
      begin
        get records_path
        response.status
      rescue => e
        expect(e.class).to eq(NoMethodError)
      end
    end
  end

  context 'login user' do
    login_user(User.first)
    it 'works(records#index page)' do
      get records_path
      expect(response.status).to eq(200)
    end

    it 'works(records#edit)' do
      record = Record.first
      get edit_record_path(record.id)
      expect(response.status).to eq(200)
    end
  end
end