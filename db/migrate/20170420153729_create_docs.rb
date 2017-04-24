class CreateDocs < ActiveRecord::Migration[5.1]
  def change
    create_table :docs do |t|
      t.string :title
      t.text :body
      t.boolean :published
      t.boolean :portfolio_item

      t.timestamps
    end
  end
end
