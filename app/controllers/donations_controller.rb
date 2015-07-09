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
    if @donation.save
      redirect_to donation_path(@donation), :alert => "Spende wurde erstellt"
    else
      redirect_to new_donation_path, :alert => "Spende konnte nicht erstellt werden"
    end
  end

  def update
    if @donation.update(donation_params)
      redirect_to donation_path(@donation), :alert => "Spende wurde aktualisiert"
    else
      redirect_to edit_donation_path(@donation), :alert => "Spende konnte nicht aktualisiert werden"
    end
  end

  def destroy
    @donation.destroy
    redirect_to :action => :index, :alert => "Spende wurde entfernt"
  end

  private
    def set_donation
      @donation = Donation.find(params[:id])
    end

    def donation_params
      params.require(:donation).permit(:title, :amount)
    end
end
