class CreatePostGenres < ActiveRecord::Migration[7.2]
  def change
    create_table :post_genres do |t|
      t.string :name

      t.timestamps
    end
  end
end
