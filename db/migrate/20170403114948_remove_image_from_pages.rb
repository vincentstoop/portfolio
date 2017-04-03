class RemoveImageFromPages < ActiveRecord::Migration[5.1]
  def change
    remove_column :pages, :image
  end
end
