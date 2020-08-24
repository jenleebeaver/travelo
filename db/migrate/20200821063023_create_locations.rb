class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :location
      t.integer :post_id, :class_name => "Post"

      t.timestamps
    end
  end
end
