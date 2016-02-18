class CocktailsController < ApplicationController

  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]
  before_action :restrict_access, only: [:new, :create]

  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = current_user.cocktails.new(params_cocktail)
    if @cocktail.save
      redirect_to @cocktail
    else
      render :new
    end
  end

  # def update
  #   @cocktail.update(params_cocktail)
  # end

  # def edit
  # end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def params_cocktail
    params.require(:cocktail).permit(:name, :description, :category_id)
  end

end
