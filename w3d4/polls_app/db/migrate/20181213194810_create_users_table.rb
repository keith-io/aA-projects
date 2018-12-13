class CreateUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users_tables do |t|
      t.string :username, uniqueness: true
      t.timestamps
    end
  end
end
