require 'rails_helper'

RSpec.describe "donation_cases/show", type: :view do
  before(:each) do
    @donation_case = assign(:donation_case, DonationCase.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
