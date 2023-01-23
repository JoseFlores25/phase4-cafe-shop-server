class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.string :title
      t.string :description
      t.references :coffee, foreign_key: {on_delete: :cascade}
      t.references :user, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
