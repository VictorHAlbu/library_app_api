class Review < ApplicationRecord
  belongs_to :book
  validates :rating, presence: true
  validates :comment, presence: true

  after_create :update_book_average_rating

  def update_book_average_rating
    self.book.update_attributes(:media => self.book.reviews.average(:rating))
  end

end
