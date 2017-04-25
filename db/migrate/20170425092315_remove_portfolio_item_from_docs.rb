class RemovePortfolioItemFromDocs < ActiveRecord::Migration[5.1]
  def change
    remove_column :docs, :portfolio_item
    add_column :docs, :type, :string
  end
end
