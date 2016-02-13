require 'rails_helper'

RSpec.describe "donation_cases/new", type: :view do
  before(:each) do
    donation_case = DonationCase.create!
  end

=begin
  it "renders new donation_case form" do
    donation_case = DonationCase.create!
    render :partial => '/donation_cases/form', locals: {f: donation_case}

    assert_select "form[action=?][method=?]", donation_cases_path, "post" do
    end
  end
=end

end
