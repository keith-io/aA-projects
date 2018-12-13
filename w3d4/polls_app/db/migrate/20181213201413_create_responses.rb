class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.integer :answer_choice_id
      t.integer :user_id
      t.text :body
      t.timestamps
    end
  end
end
