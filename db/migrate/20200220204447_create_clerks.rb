class CreateClerks < ActiveRecord::Migration[5.2]
  def change
    create_table :clerks do |t|
      t.string :name
      t.datetime :time
      t.integer :age
      t.timestamps
    end
  end
end
