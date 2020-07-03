class Book < ApplicationRecord
  belongs_to :author
  has_one_attached :photo
  validates :title, uniqueness: true
  validates :title, presence: true

end
