class Wine < ApplicationRecord
  belongs_to :manufactory_by, class_name: 'Winery'
end
