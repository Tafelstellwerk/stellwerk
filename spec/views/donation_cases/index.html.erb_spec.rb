require 'rails_helper'

RSpec.describe "donation_cases/index", type: :view do
  before(:each) do
    assign(:donation_cases, [
      DonationCase.create!(),
      DonationCase.create!()
    ])
  end

  it "renders a list of donation_cases" do
    render
  end
end
