class ReviewsController < ApplicationController
  before_action :set_cocktail, only: [:edit, :update, :new, :create]
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :check_author, only: [:edit, :update, :destroy]

  def new
    @review = @cocktail.reviews.new
  end

  def create
    @review = @cocktail.reviews.new(reviews_params)
    if @review.save
      redirect_to @cocktail
    else
      render "cocktails/show"
    end
  end

  def edit
  end

  def update
    @review.update(reviews_params)
    redirect_to @cocktail
  end

  def destroy
    @review.destroy
    redirect_to '/'
  end

private
  def reviews_params
    params[:review][:user_id] = current_user.id
    params.require(:review).permit(:cocktail_id, :user_id, :content, :rating)
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def check_author
    unless current_user == @review.user
      raise ActionController::RoutingError.new("You're not allowed here.")
    end
  end
end
