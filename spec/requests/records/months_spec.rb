require 'rails_helper'

RSpec.describe "Records::Months", type: :request do
  describe "GET /records/:years/:months" do
    it "works! (now write some real specs)" do
      ['2015/1', '2015/12', '2016/1', '2016/5'].each do |date|
        get "/records/#{date}"
        expect(response).to have_http_status(302)
      end
    end
  end
end
