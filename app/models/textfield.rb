# a type of FF component
class Textfield < Component
  validates_presence_of :data

  validate :valid_data_json?

  FIELD_MAX_LENGTH = 96
  JSON_SCHEMA = {
    type: 'object',
    required: %w[label required],
    properties: {
      label: {
        type: 'string',
        maxLength: 40
      },
      required: {
        type: 'boolean'
      },
    }
  }

  def valid_data_json?
    !JSON::Validator.validate(JSON_SCHEMA, data)
  rescue JSON::Schema::ValidationError
    errors.add(:data, 'invalid data')
  end
end
