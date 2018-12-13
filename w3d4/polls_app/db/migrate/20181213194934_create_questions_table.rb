class CreateQuestionsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :questions_tables do |t|
      t.text :body
      t.integer :poll_id
      t.timestamps
    end
  end
end
