class AddAdminIdToDocs < ActiveRecord::Migration[5.1]
  def change
    add_column :docs, :admin_id, :integer
  end
end
