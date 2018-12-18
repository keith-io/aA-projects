class CreateCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
      t.string :name, null: false
      t.string :sex, limit: 1, 
                      inclusion: { in: ['M', 'F'],
                                    as: :trigger,
                                    message: "must be M or F" }
      t.text :description
      t.string :color
      t.date :birth_date, null: false

      t.timestamps
    end
  end
end
