class CreateBeds < ActiveRecord::Migration[5.2]
  def change
    create_table :beds do |t|
            t.integer :beds
            t.references :ward, foreign_key: true
      t.timestamps
    end
  end
end
