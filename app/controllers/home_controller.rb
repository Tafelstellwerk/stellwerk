class HomeController < ApplicationController
  before_action :authenticate_user!, :except => [:index_signed_out]

  def index
    @user = current_user
    @donation_cases = DonationCase.all
  end

  def index_signed_out

  end
end
