class IngredientsController < ApplicationController

  before_action :et_cingredient, only: [:show, :edit, :update, :destroy]
  before_action :restrict_access, only: [:new, :create]

  def index
    @ingredients = Ingredient.all
  end

  def show
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = current_user.ingredients.new(arams_cingredient)
    if @ingredient.save
      redirect_to @ingredient
    else
      render :new
    end
  end

  # def update
  #   @ingredient.update(params_ingredient)
  # end

  # def edit
  # end

  def destroy
    @ingredient.destroy
    redirect_to ingredients_path
  end

private

  def et_cingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def arams_cingredient
    params.require(:ingredient).permit(:name, :description, :category_id)
  end

end
