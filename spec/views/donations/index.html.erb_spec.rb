require 'rails_helper'

RSpec.describe "donations/index", type: :view do
  before(:each) do
    assign(:donations, [
      Donation.create!(
        :title => "Title",
        :amount => 1
      ),
      Donation.create!(
        :title => "Title",
        :amount => 1
      )
    ])
  end

  it "renders a list of donations" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
