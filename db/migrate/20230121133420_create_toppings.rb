class CreateToppings < ActiveRecord::Migration[6.1]
  def change
    create_table :toppings do |t|
      t.string :name
      t.references :coffee, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
