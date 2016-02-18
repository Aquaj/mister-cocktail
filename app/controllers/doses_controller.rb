class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create]
  before_action :set_dose, only: [:destroy]

  def new
    @dose = @cocktail.doses.new
  end

  def create
    @dose = @cocktail.doses.new(dose_params)
    if @dose.save
      redirect_to @cocktail
    else
      render :new
    end
  end

  def destroy
    @dose.destroy
    redirect_to '/'
  end

private
  def dose_params
    params.require(:dose).permit(:cocktail_id, :ingredient_id, :description)
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end