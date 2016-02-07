require 'rails_helper'

RSpec.describe "DonationCases", type: :request do
  describe "GET /donation_cases" do
    it "works! (now write some real specs)" do
      get donation_cases_path
      expect(response).to have_http_status(200)
    end
  end
end
