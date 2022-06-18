class ReviewsController < ApplicationController
	before_action :set_book
	before_action :set_review, only: [:show, :edit, :update, :destroy]
 
  def index 
    @reviews = @book.reviews.order(created_at: :desc)
    render json: @reviews
	end

	def show
		render json: @review
	end

	def create
		@review = @book.reviews.build(review_params)
		if @review.save
			render status: :created, json: @review
		else
      render json: @review.errors, status: :unprocessable_entity
		end
	end

	def edit
	end

	def update
		if @review.update(review_params)
      render :show, status: :ok, location: @review
    else
      render json: @review.errors, status: :unprocessable_entity
		end
	end

	def destroy
		@review.destroy
	end

	private

  def review_params
    params.require(:review).permit(:book_id, :rating, :comment)
	end

	def set_book
		@book = Book.find(params[:book_id])
	end

  def set_review
    @review = Review.find(params[:id])
  end

end