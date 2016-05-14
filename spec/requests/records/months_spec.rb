require 'rails_helper'

RSpec.describe "Records::Months", type: :request do
  describe "GET /records/:years/:months" do
    it "works! (now write some real specs)" do
      get '/records/2016/5'
      expect(response).to have_http_status(302)
    end
  end
end
