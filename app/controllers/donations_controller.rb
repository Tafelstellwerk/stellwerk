class DonationsController < ApplicationController

  def destroy
    @donation = Donation.joins(:donation_case).where(donation_cases: {token: params[:token]}).where(id: params[:id]).first
    @donation.destroy
    redirect_to edit_donation_case_path(@donation.donation_case, token: params[:token]), notice: t('.delete')
  end
end
