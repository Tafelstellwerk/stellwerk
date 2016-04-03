require 'rails_helper'
require 'spec_helper'

RSpec.describe "donation_cases/edit.html.erb", type: :view do
  before(:each) do
    @donation_case = assign(:donation_case, DonationCase.create!())
    @donation_case.donations.create!
    @donation_case_changeset = Hash.new
    @donations_changeset = Hash.new


  end

  it "renders the edit donation_case form" do
    helper.stub(:user_signed_in?) {true}
    render template: "donation_cases/edit.html.erb"

    assert_select "form[action=?][method=?]", donation_case_path(@donation_case, token: donation_case.token, method: :put), "post" do
      assert_select "input#donation_case_company_name[name=?]", "donation_case[company_name]"

      assert_select "input#donation_case_contact_name[name=?]", "donation_case[contact_name]"
    end
  end
end
