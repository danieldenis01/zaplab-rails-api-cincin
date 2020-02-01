class Review < ApplicationRecord
  belongs_to :reviewer, class_name: 'User'
  belongs_to :wine

  validates :description, presence: true
  validates :description, length: { minimum: 10 }
  validates :rating, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5, allow_blank: true}
end
