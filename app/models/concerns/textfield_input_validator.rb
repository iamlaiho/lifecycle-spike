# to validate submission form's input
class TextfieldInputValidator < ActiveModel::Validator
  def validate(record)
    record.errors.add(:max_length, 'exceeded max length') if record.value.length > Textfield::FIELD_MAX_LENGTH
  end
end
