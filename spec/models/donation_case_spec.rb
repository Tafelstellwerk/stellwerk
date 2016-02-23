require 'rails_helper'

RSpec.describe DonationCase, type: :model do

  before(:each) do
    @donation_case = DonationCase.create!
  end

  it "sets the token before create" do
    expect(@donation_case.token).to be_truthy
  end

  it "doesnt change the token on save" do
    match = @donation_case.token
    @donation_case.save!
    expect(@donation_case.token).to eql(match)
  end

  describe "get_changeset method" do
    it "get_changeset(false) returns an empty Hash" do
      expect(@donation_case.get_changeset(false)).to eql(Hash.new)
    end

    it "get_changeset(true) returns a changeset Hash" do
      @donation_case.title = "test"
      @donation_case.save!
      expect(@donation_case.get_changeset(true)).to eql(@donation_case.versions.last.changeset)
    end
  end

  describe "update_with_need_review_flag" do
    it "update_with_need_review_flag({},false) sets need_review to true" do
      @donation_case.update_with_need_review_flag({},false)
      expect(@donation_case.need_review).to eql(true)
    end

    it "update_with_need_review_flag({},true) sets need_review to false" do
      @donation_case.update_with_need_review_flag({},true)
      expect(@donation_case.need_review).to eql(false)
    end
  end

  describe "get_donations_changeset" do
    it "get_donations_changeset(false) returns an empty Hash" do
      expect(@donation_case.get_donations_changeset(false)).to eql(Hash.new)
    end

    it "get_donations_changeset(true) returns an empty Hash if no review is needed" do
      @donation_case.need_review = false
      expect(@donation_case.get_donations_changeset(true)).to eql(Hash.new)
    end

    it "get_donations_changeset(true) returns a donation changeset if a review is needed" do
      @donation = @donation_case.donations.create(title: "test")
      @donation_case.need_review = true
      expect(@donation_case.get_donations_changeset(true)).to eql({@donation.id => @donation.versions.last.changeset})
    end
  end
end
