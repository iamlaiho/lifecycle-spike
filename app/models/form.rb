# store form configuration
class Form < ApplicationRecord
  belongs_to :lifecycle_item
  has_many :components
  has_many :submissions
end
