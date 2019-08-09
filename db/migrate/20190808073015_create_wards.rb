class CreateWards < ActiveRecord::Migration[5.2]
  def change
    create_table :wards do |t|
     
      t.string :wards_name

       t.references :department, foreign_key: true
      t.timestamps
    end
  end
end
