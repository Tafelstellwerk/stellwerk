class DonationsController < ApplicationController
  before_action :set_donation, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @donations = Donation.all
  end

  def show
  end

  def new
    @donation = Donation.new
  end

  def edit
  end

  def create
    @donation = Donation.new(donation_params)
    @donation.save
  end

  def update
    @donation.update(donation_params)
  end

  def destroy
    @donation.destroy
  end

  private
    def set_donation
      @donation = Donation.find(params[:id])
    end

    def donation_params
      params.require(:donation).permit(:title, :amount)
    end
end
