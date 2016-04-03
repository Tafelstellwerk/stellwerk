class WishlistsController < ApplicationController
  def index
    @closed_donation_cases = DonationCase.where(closed: true)
  end

  def show
    @closed_donation_case = DonationCase.where(token: params[:token]).where(closed: true).find_by(id: params[:id])
  end

  def new
    @tafeln = Tafel.all
    @closed_donation_case = DonationCase.where(token: params[:token]).where(closed: true).first
    @wishlist = @closed_donation_case.wishlists.build
    @closed_donation_case.donations.each do |donation|
      @wishlist.wishes.build(name: donation.title)
    end
  end

  def create
    @closed_donation_case = DonationCase.where(token: params[:token]).where(closed: true).first
    @closed_donation_case.wishlists.create( param_wishlist)
    redirect_to wishlists_path
  end

  private
    def param_wishlist
      params.require(:wishlist).permit([:tafel_id], wish_attributes)
    end

    def wish_attributes
      {wishes_attributes: [:amount, :name]}
    end

end