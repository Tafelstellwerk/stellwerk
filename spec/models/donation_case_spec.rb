require 'rails_helper'

RSpec.describe DonationCase, type: :model do
  it "sets the token before create" do
    donation_case = DonationCase.create!
    expect(donation_case.token).to be_truthy
  end

  it "doesnt change the token on save" do
    donation_case = DonationCase.create!
    match = donation_case.token
    donation_case.save!
    expect(donation_case.token).to eql(match)
  end
end
