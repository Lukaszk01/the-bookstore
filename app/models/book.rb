class Book < ApplicationRecord
  belongs_to :author
include Elasticsearch::Model
include Elasticsearch::Model::Callbacks

  def as_indexed_json(options = {})
    self.as_json(
      only: [:name, :isbn, :published_at, :pages],
      include: {
        author: {
          only: [:first_name, :last_name]
        }
      }
    )
  end

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
