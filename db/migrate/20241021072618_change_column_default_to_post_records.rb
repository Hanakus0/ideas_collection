class ChangeColumnDefaultToPostRecords < ActiveRecord::Migration[7.2]
  def change
     change_column_default :post_records, :view_count, from: nil, to: 0
  end
end
