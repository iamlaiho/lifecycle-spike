# a type of FF component
class Paragraph < Component
  validates_presence_of :data

  validate :valid_data_json?

  JSON_SCHEMA = {
    type: 'object',
    required: %w[text],
    properties: {
      text: {
        type: 'string',
        maxLength: 1000
      },
    }
  }

  def valid_data_json?
    !JSON::Validator.validate(JSON_SCHEMA, data)
  rescue JSON::Schema::ValidationError
    errors.add(:data, 'invalid data')
  end
end
