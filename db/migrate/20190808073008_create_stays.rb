class CreateStays < ActiveRecord::Migration[5.2]
  def change
    create_table :stays do |t|
      t.datetime :a_time
      t.datetime :d_time
      t.references :patient, foreign_key: true
      t.references :ward, foreign_key: true
      t.references :doctor, foreign_key: true
      t.timestamps
    end
  end
end
