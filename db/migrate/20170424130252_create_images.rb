class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :title
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
