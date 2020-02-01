class Wine < ApplicationRecord
  belongs_to :manufactory_by, class_name: 'Winery'
  has_many :reviews, dependent: :restrict_with_exception

  validates :name, presence: true
  validates :name, length: { maximum: 100 }
  validates :price, numericality: { greater_than: 1.0, less_than_or_equal_to: 99999999.99, allow_blank: true }
end
