class Author < ApplicationRecord
  has_many :books
  has_many :books, dependent: :destroy
  has_one_attached :photo
  validates :name, uniqueness: true
  validates :name, presence: true
end
