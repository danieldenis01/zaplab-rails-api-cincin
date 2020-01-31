class Winery < ApplicationRecord
  has_many :wines, foreign_key: :manufactory_by_id, dependent: :restrict_with_exception

  validates :name, presence: true
  validates :name, length: { maximum: 100 }
end
