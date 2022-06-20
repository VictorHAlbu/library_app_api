json.book do
  json.id @book.id
  json.title @book.title
  json.author @book.author
  json.genre @book.genre
  
  json.reviews @book.reviews

end