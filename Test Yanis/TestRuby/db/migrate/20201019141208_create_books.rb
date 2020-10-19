class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :nom
      t.text :description
      t.date :datePublication
      t.string :auteur
      t.decimal :prix

      t.timestamps
    end
  end
end
