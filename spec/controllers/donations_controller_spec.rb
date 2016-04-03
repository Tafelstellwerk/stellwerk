require 'rails_helper'
RSpec.describe DonationsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Donation. As you add validations to Donation, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    FactoryGirl.attributes_for(:donation)
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for(:donation, amount: "String")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DonationsController. Be sure to keep this updated too.
  let(:valid_session) { {} }


  describe "DELETE #destroy" do
    it "destroys the requested donation" do
      donation_case = DonationCase.create!
      donation = donation_case.donations.create! valid_attributes
      expect {
        delete :destroy, {:id => donation.to_param, token: donation_case.token}, valid_session
      }.to change(Donation, :count).by(-1)
    end
  end

end
