require 'rails_helper'

RSpec.describe "DonationCases", type: :request do
  describe "GET /donation_cases" do
    it "it redirects to sign_up if not authenticated" do
      get donation_cases_path
      expect(response).to have_http_status(302)
    end
  end
end
