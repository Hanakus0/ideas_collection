class AddIndexToTables < ActiveRecord::Migration[7.2]
  def change
    add_index :comments, :created_at
    add_index :posts, :created_at
    add_index :users, :screen_name
  end
end
