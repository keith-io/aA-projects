class AddKarmaToSubs < ActiveRecord::Migration[5.2]
  def change
    add_column :subs, :karma, :integer
  end
end
