class RemoveBodyFromResponses < ActiveRecord::Migration[5.2]
  def change
    change_table :responses do |t|
      t.remove :body
    end
  end
end
