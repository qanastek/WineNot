class CreateWines < ActiveRecord::Migration[6.0]
  def change
    create_table :wines do |t|
      t.string :name
      t.text :description
      t.references :wine_color, null: false, foreign_key: true
      t.integer :vintage
      t.references :wine_maker, null: false, foreign_key: true
      t.string :country
      t.string :region
      t.string :appellation
      t.decimal :price

      t.timestamps
    end
  end
end
