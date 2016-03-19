class DonationDeliveriesController < ApplicationController
  before_action :authenticate_user!

  # GET /donation_deliveries
  def index
    @closed_donation_cases = DonationCase.where( closed: true)
  end

  # GET /donation_deliveries/1/edit
  def edit
    @donation_case = DonationCase.find_by(id: params[:id])
  end

  # PATCH/PUT /donation_deliveries/1
  def update
    if @donation_case.update_with_closed_flag(donation_deliveries_params)
      redirect_to edit_donation_deliveries_path(@donation_case), notice: t('.update')
    else
      render :edit
    end
  end

  # GET /donation_delivery/1/reopen
  def reopen
    @donation_case = DonationCase.find_by(id: params[:id])
    if @donation_case.update_attribute(:closed, false)
      redirect_to edit_donation_case_path(@donation_case, token: @donation_case.token), notice: t('.open')
    else
      render :edit
    end
  end

  # DELETE /donation_deliveries/1
  def destroy
    @donation_case.destroy
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def donation_deliveries_params
    params.require(:donation_case).permit(donation_case_attributes, donation_attributes)
  end

  #shorten permit in donation_case_params
  def donation_case_attributes
    [:title, :comment, :company_name, :address, :plz_and_city, :contact_name, :phone, :email]
  end

  #shorten permit in donation_case_params
  def donation_attributes
    { donations_attributes: [:title, :amount, :best_before_date, :availible_from, :froozen, :supporting_document, :fetch_time,:id]}
  end


end
