class CreateResponsesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :responses_tables do |t|
      t.integer :question_id
      t.integer :user_id
      t.text :body
      t.timestamps
    end
  end
end
