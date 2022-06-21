class BooksController < ApplicationController
  before_action :set_book, only: %i[ show update destroy ]
  
  def index
    @books = Book
    .search(search_params, params[:search])
    .order(id: :desc)

    render json: @books
  end

  
  def show
   render json: @book
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

    def search_params
      ["books.title", "books.author", "books.genre"]
    end
end
