class RenameFollowewIdColumnToFollows < ActiveRecord::Migration[7.2]
  def change
    rename_column :follows, :followew_id, :followee_id
  end
end
