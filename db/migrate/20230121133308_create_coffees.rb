class CreateCoffees < ActiveRecord::Migration[6.1]
  def change
    create_table :coffees do |t|
      t.string :name
      t.string :price
      t.references :user, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
