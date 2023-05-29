class CreateComponents < ActiveRecord::Migration[7.0]
  def change
    create_table :components do |t|
      t.references :forms, foreign_key: true
      t.string :type
      t.string :order
      t.string :tag
      t.jsonb :data
      t.timestamps
    end
  end
end
