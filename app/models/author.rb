class Author < ApplicationRecord
  has_many :books
  has_many :books, dependent: :destroy
  validates :name, uniqueness: true
  validates :name, presence: true
end
