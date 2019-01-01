class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :sub_id, null: false
      t.integer :karma
      t.string :url
      t.string :title, null: false
      t.text :content, null: false
      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :sub_id
  end
end
