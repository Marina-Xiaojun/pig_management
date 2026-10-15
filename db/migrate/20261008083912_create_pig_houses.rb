class CreatePigHouses < ActiveRecord::Migration[7.2]
  def change
    create_table :pig_houses do |t|
      t.string :name

      t.timestamps
    end
  end
end
