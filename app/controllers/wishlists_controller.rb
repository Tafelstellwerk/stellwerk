class WishlistsController < ApplicationController
  def index
    @closed_donation_cases = DonationCase.where(closed: true)
  end

  def show
    @closed_donation_case = DonationCase.where(token: params[:token]).where(closed: true).find_by(id: params[:id])
  end

  def new
    @closed_donation_case = DonationCase.where(token: params[:token]).where(closed: true).find_by(id: params[:id])
    @wishlist = @closed_donation_case.build
    
  end

  def create
  end

end