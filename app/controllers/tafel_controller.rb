class TafelController < ApplicationController
  def index
    @new_tafel = Tafel.new
    @tafeln = Tafel.all
  end

  def edit
    @edit_tafel = Tafel.find_by(id: params[:id])
    @tafeln = Tafel.all
  end

  def create
    Tafel.create!(param_tafel)
    redirect_to tafel_index_path
  end

  def update
    @edit_tafel = Tafel.find_by(id: params[:id])
    @edit_tafel.update_attributes(param_tafel)
    redirect_to tafel_index_path
  end

  def destroy
  end

  private
  def param_tafel
    params.require(:tafel).permit(:name, :email)
  end
end