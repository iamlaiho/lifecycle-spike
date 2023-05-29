class CreateLifecycleItems < ActiveRecord::Migration[7.0]
  def change
    create_table :lifecycle_items do |t|
      t.string :name
      t.timestamps
    end
  end
end
