class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :age
      t.string :weight
      t.string :dis
      t.string :phone
      t.text :address
      t.timestamps
    end
  end
end
