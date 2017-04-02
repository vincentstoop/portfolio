class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :organisation
      t.text :message
      t.boolean :receive_copy

      t.timestamps
    end
  end
end
