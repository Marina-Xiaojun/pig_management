class CreateEmployees < ActiveRecord::Migration[7.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :employee_id
      t.string :password_digest

      t.timestamps
    end
    
    add_index :employees, :employee_id, unique: true
  end
end
