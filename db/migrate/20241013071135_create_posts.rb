class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.string :post_uid
      t.references :user, null: false, foreign_key: true
      t.references :post_genre, null: false, foreign_key: true
      t.json :images
      t.string :title
      t.text :content
      t.boolean :draft_flg

      t.timestamps
    end
  end
end
