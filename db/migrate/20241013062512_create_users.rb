class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :user_uid
      t.string :screen_name
      t.string :account_name
      t.string :profile_image
      t.string :name
      t.integer :gender
      t.integer :age
      t.text :introduction

      t.timestamps
    end
  end
end
