require "rails_helper"

RSpec.describe DonationCasesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/donation_cases").to route_to("donation_cases#index")
    end

    it "routes to #new" do
      expect(:get => "/donation_cases/new").to route_to("donation_cases#new")
    end

    it "routes to #show" do
      expect(:get => "/donation_cases/1").to route_to("donation_cases#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/donation_cases/1/edit").to route_to("donation_cases#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/donation_cases").to route_to("donation_cases#create")
    end

    it "routes to #update" do
      expect(:put => "/donation_cases/1").to route_to("donation_cases#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/donation_cases/1").to route_to("donation_cases#destroy", :id => "1")
    end

  end
end
