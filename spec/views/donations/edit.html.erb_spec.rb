require 'rails_helper'

RSpec.describe "donations/edit", type: :view do
  before(:each) do
    @donation = assign(:donation, Donation.create!(
      :title => "MyString",
      :amount => 1
    ))
  end

  it "renders the edit donation form" do
    render

    assert_select "form[action=?][method=?]", donation_path(@donation), "post" do

      assert_select "input#donation_title[name=?]", "donation[title]"

      assert_select "input#donation_amount[name=?]", "donation[amount]"
    end
  end
end
