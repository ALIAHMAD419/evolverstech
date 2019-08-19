class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  belongs_to :room, optional: true
  
  validates :start_time,:end_time, presence: true
  validates :doctor_id, :patient_id, :room_id,presence: true

  # validate :end_date_after_start_date

  def end_date_after_start_date
    if Time.now > self.start_time
      errors.add(:start_time, "must be after the current date")
    elsif Time.now > self.end_time
      errors.add(:end_time, "must be after the current date")
    elsif self.start_time > self.end_time
      errors.add(:end_time, "must be after the greater than end time of Appointment")
    end
  end
end
