class Book < ApplicationRecord
  belongs_to :author
  has_many :covers
  validates :title, uniqueness: true
  validates :title, presence: true
   validates :name, uniqueness: true
  validates :name, presence: true
end
