class DonationCasesController < ApplicationController
  before_action :set_donation_case, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:edit, :update]

  # GET /donation_cases
  def index
    @changed_donation_cases = DonationCase.where( need_review: true)
    @unchanged_donation_cases = DonationCase.where( need_review: false)
  end

  # GET /donation_cases/1
  def show
    redirect_to edit_donation_case_path(@donation_case)
  end

  # GET /donation_cases/new
  def new
    @donation_case = DonationCase.create!
    @donation = @donation_case.donations.create!
    redirect_to edit_donation_case_path(@donation_case, token: @donation_case.token)
  end

  # GET /donation_cases/1/edit
  def edit
    @donation_case_changeset = @donation_case.get_changeset(user_signed_in?)
    @donations_changeset = @donation_case.get_donations_changeset(user_signed_in?)
    render "/donation_cases/nope.html.erb", layout: false unless @donation_case.present?
  end

  # POST /donation_cases
  def create
    @donation_case = DonationCase.new(donation_case_params)

    if @donation_case.save
      redirect_to edit_donation_case_path(@donation_case, token: @donation_case.token), notice: 'Donation case was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /donation_cases/1
  def update
    if @donation_case.update_with_need_review_flag(donation_case_params, user_signed_in?)
      redirect_to edit_donation_case_path(@donation_case, token: @donation_case.token), notice: 'Donation case was successfully updated.'
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
      @donation_case = DonationCase.find_by(token: params[:token])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donation_case_params
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
