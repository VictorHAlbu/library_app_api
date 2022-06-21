json.book do
  json.id @book.id
  json.title @book.title
  json.author @book.author
  json.genre @book.genre
  json.media @book.media
  
  json.reviews @book.reviews

end