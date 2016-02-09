require 'rails_helper'

RSpec.describe "donation_cases/new", type: :view do
  before(:each) do
    assign(:donation_case, DonationCase.new())
  end

  it "renders new donation_case form" do
    render :partial => "donation_cases/form.html.erb"

    assert_select "form[action=?][method=?]", donation_cases_path, "post" do
    end
  end
end
