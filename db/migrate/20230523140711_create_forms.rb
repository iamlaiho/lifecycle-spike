class CreateForms < ActiveRecord::Migration[7.0]
  def change
    create_table :forms do |t|
      t.references :lifecycle_item, foreign_key: true
      t.string :form_type
      t.string :version
      t.timestamps
    end
  end
end
