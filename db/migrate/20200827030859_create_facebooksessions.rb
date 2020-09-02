class CreateFacebooksessions < ActiveRecord::Migration[6.0]
  def change
    create_table :facebooksessions do |t|
      t.string :email
      t.string :uid
      t.string :image
      #should this be :name?
      t.string :full_name

      t.timestamps
    end
  end
end
