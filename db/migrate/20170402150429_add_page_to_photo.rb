class AddPageToPhoto < ActiveRecord::Migration[5.1]
  def change
    add_reference :photos, :page, foreign_key: true
  end
end
