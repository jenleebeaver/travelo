class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.string :password_digest
      t.string :username
      t.string :location
      t.string :uid
      t.string :image

      t.timestamps
    end
  end
end
