class CreateInputFields < ActiveRecord::Migration[7.0]
  def change
    create_table :input_fields do |t|
      t.references :component, foreign_key: true
      t.references :submission, foreign_key: true
      t.string :value
      t.timestamps
    end
  end
end
