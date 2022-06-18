class BooksController < ApplicationController
  before_action :set_book, only: %i[ show update destroy ]
  
  def index
    @books = Book.all.order("created_at DESC")
  end

  
  def show

  end

  def create
    @book = current_user.books.new(book_params)

    if @book.save
      render :show, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  
  def update
    if @book.update(book_params)
      render :show, status: :ok, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  
  def destroy
    @book.destroy
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :author, :genre,:user_id)
    end
end
