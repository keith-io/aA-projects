class CreatePollsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :polls_tables do |t|
      t.string :title, uniqueness: true
      t.integer :author_id
      t.timestamps
    end
  end
end