class DonationCasesController < ApplicationController
  before_action :set_donation_case, only: [:show, :edit, :update, :destroy]

  # GET /donation_cases
  def index
    @donation_cases = DonationCase.all
  end

  # GET /donation_cases/1
  def show
    redirect_to edit_donation_case_path(@donation_case)
  end

  # GET /donation_cases/new
  def new
    @donation_case = DonationCase.create!
    @donation = @donation_case.donations.create!
    redirect_to edit_donation_case_path(@donation_case)
  end

  # GET /donation_cases/1/edit
  def edit
  end

  # POST /donation_cases
  def create
    @donation_case = DonationCase.new(donation_case_params)

    if @donation_case.save
      redirect_to @donation_case, notice: 'Donation case was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /donation_cases/1
  def update
    if @donation_case.update(donation_case_params)
      redirect_to @donation_case, notice: 'Donation case was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /donation_cases/1
  def destroy
    @donation_case.destroy
      redirect_to donation_cases_url, notice: 'Donation case was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation_case
      @donation_case = DonationCase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donation_case_params
      params.require(:donation_case).permit(:title, :comment, :company_name, :address, :plz_and_city, :contact_name, :phone, :email, donations_attributes: [:title, :amount, :best_before_date, :availible_from, :froozen, :supporting_document, :fetch_time,:id])
    end
end
