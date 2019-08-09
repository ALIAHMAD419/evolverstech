class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.references :doctor, foreign_key: true
      t.references :patient, foreign_key: true

      t.references :room, foreign_key: true

      t.datetime  :start_time
      t.datetime  :end_time

      t.timestamps
    end
  end
end
