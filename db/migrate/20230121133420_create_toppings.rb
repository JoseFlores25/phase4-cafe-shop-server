class CreateToppings < ActiveRecord::Migration[6.1]
  def change
    create_table :toppings do |t|
      t.string :name
      t.references :coffee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
