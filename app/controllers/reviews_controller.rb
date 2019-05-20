class ReviewsController < ApplicationController
  def create
      @review = Review.new(review_params)
      # @review.user = current_user
      @review.user_id = session[:user_id]
      @review.product_id = params[:product_id]

      if @review.save

        redirect_to "/products/#{@review.product_id}"
      else
        redirect_to :back
      end
    end

    def destroy
      @delete.destroy
      redirect_to product_path(@delete.product_id)
    end

     private
     def review_params
      params.require(:review).permit(
        :product_id,
        :user_id,
        :description,
        :rating,
        :created_at,
        :updated_at
      )
    end

    protected
  def delete_review
      @delete = Review.find params[:id]
  end

  def new_review
    @review = Review.new(review_params)
  end

end