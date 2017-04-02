class AddAdminToPages < ActiveRecord::Migration[5.1]
  def change
    add_reference :pages, :admin, foreign_key: true
  end
end
