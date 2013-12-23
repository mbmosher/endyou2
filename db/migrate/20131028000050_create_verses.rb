class CreateVerses < ActiveRecord::Migration
  def change
    create_table :verses do |t|
      t.string :image
      t.string :map
      t.float :latitude
      t.float :longitude
      t.text :text
      t.string :code
      t.boolean :unlocked

      t.timestamps
    end
  end
end
