class CreateStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :staffs do |t|
      t.string   :name
      t.string   :age
      t.datetime :time
      t.string   :duty
      t.string   :floor
      t.references :ward, foreign_key: true
      t.timestamps
    end
  end
end
