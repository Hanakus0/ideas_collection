class CreatePostRecords < ActiveRecord::Migration[7.2]
  def change
    create_table :post_records do |t|
      t.references :post, null: false, foreign_key: true
      t.integer :view_count

      t.timestamps
    end
  end
end
