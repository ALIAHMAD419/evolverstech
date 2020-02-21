class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  
  validates :start_time,:end_time, presence: true
  validates :doctor_id, :patient_id,presence: true
end
