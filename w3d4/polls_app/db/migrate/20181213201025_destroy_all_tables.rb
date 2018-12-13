class DestroyAllTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :answer_choices_tables
    drop_table :polls_tables
    drop_table :questions_tables
    drop_table :responses_tables
    drop_table :users_tables
  end
end
