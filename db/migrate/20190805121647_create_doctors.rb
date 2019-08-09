class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :spec
      t.datetime :hours
      t.integer :fees
      t.references :department, foreign_key: true
      t.timestamps
    end
  end
end
