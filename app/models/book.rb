class Book < ApplicationRecord
  belongs_to :author
  has_many :covers
  validates :title, uniqueness: true
  validates :title, presence: true
   validates :name, uniqueness: true
  validates :name, presence: true
  # def self.search(search)
  #   if search
  #     book = Book.find_by(name: search)
  #     if book
  #       self.where(book_id: book)
  #     else
  #       Book.all
  #     end
  #   else
  #     Book.all
  #   end
  # end
end
