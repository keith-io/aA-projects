class CreateAnswerChoicesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_choices_tables do |t|
      t.integer :question_id
      t.text :text, uniqueness: true
      t.timestamps
    end
  end
end
