# user form submission's inputs
class InputField < ApplicationRecord
  belongs_to :submission
  belongs_to :component

  validates_with TextfieldInputValidator, if: -> { component.is_a?(Textfield) }
end
