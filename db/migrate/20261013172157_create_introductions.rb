class CreateIntroductions < ActiveRecord::Migration[7.2]
  def change
    create_table :introductions do |t|
      t.references :pig_house, null: false, foreign_key: true
      t.date :introduction_date
      t.integer :head_count
      t.integer :age_months

      t.timestamps
    end
  end
end
