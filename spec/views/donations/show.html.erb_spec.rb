require 'rails_helper'

RSpec.describe "donations/show", type: :view do
  before(:each) do
    @donation = assign(:donation, Donation.create!(
      :title => "Title",
      :amount => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/1/)
  end
end
