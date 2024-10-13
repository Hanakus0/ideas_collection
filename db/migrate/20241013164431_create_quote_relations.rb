class CreateQuoteRelations < ActiveRecord::Migration[7.2]
  def change
    create_table :quote_relations do |t|
      t.references :post, null: false, foreign_key: { to_table: :posts }
      t.references :quote_post, null: false, foreign_key: { to_table: :posts }

      t.timestamps
    end
  end
end
