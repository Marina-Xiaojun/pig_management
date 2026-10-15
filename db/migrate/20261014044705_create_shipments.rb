class CreateShipments < ActiveRecord::Migration[7.2]
  def change
    create_table :shipments do |t|
      t.references :pig_house, null: false, foreign_key: true
      t.references :destination, null: false, foreign_key: true
      t.date :shipment_date
      t.integer :head_count
      t.integer :age_months

      t.timestamps
    end
  end
end
