class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.integer :user_id
      t.string :body
      # t.boolean :private?
      t.timestamps
    end
  end
end
