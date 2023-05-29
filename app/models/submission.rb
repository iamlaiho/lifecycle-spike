# user form submission
class Submission < ApplicationRecord
  belongs_to :form
  has_many :input_fields

  validates_presence_of :status

  accepts_nested_attributes_for :input_fields
end
