json.extract! book, :id, :title, :author, :genre, :created_at, :updated_at, book.reviews
json.url book_url(book, format: :json)
