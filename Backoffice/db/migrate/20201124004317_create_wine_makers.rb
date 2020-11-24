class CreateWineMakers < ActiveRecord::Migration[6.0]
  def change
    create_table :wine_makers do |t|
      t.string :name

      t.timestamps
    end
  end
end
