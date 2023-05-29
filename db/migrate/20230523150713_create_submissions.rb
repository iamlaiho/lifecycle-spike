class CreateSubmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :submissions do |t|
      t.references :form, foreign_key: true
      t.string :status
      t.timestamps
    end
  end
end
