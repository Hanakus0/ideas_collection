class ChangeDraftFlgOfPosts < ActiveRecord::Migration[7.2]
  def change
    change_column :posts, :draft_flg, 'integer USING CAST(draft_flg AS integer)'
  end
end
