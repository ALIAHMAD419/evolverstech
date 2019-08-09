class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.integer :bill
      t.references :stay, foreign_key: true
      t.timestamps
    end
  end
end
