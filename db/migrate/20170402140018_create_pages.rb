class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.string :image
      t.boolean :portfolio_item

      t.timestamps
    end
  end
end
