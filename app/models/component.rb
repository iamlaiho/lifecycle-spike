# FF components
class Component < ApplicationRecord
  belongs_to :form
  has_many :input_fields

  validates_presence_of :tag
  validates_presence_of :order
end
