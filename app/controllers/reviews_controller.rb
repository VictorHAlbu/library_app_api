class ReviewsController < ApplicationController
	before_action :find_book
	before_action :find_review, only: [:edit, :update, :destroy]
 
  def index 
    reviews = Review.all
    render json: @reviews
  end

	def new
		@review = Review.new
	end

	def create
		@review = Review.new(review_params)
		@review.book_id = @book.id
		@review.user_id = current_user.id

		if @review.save
			render :show, status: :created, location: @review
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
    params.require(:review).permit(:book_id,:rating, :comment)
  end

  def find_book
    @book = Book.find(params[:book_id])
  end

  def find_review
    @review = Review.find(params[:id])
  end

end