class Author < ApplicationRecord
  has_many :books, dependent: :destroy
  validates :name, uniqueness: true
  validates :name, presence: true
  #  validates :book, uniqueness: true
  # validates :book, presence: true
end
