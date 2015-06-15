require 'rails_helper'

RSpec.describe "donations/new", type: :view do
  before(:each) do
    assign(:donation, Donation.new(
      :title => "MyString",
      :amount => 1
    ))
  end

  it "renders new donation form" do
    render

    assert_select "form[action=?][method=?]", donations_path, "post" do

      assert_select "input#donation_title[name=?]", "donation[title]"

      assert_select "input#donation_amount[name=?]", "donation[amount]"
    end
  end
end
