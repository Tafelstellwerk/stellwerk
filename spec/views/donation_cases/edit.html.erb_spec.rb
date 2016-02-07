require 'rails_helper'

RSpec.describe "donation_cases/edit", type: :view do
  before(:each) do
    @donation_case = assign(:donation_case, DonationCase.create!())
  end

  it "renders the edit donation_case form" do
    render

    assert_select "form[action=?][method=?]", donation_case_path(@donation_case), "post" do
    end
  end
end
