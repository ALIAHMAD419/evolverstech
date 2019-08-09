class Stay < ApplicationRecord
  belongs_to :patient, optional: true
  belongs_to :ward, optional: true
  belongs_to :doctor, optional: true
  has_one :bill
  accepts_nested_attributes_for :patient, allow_destroy: true

  validates :a_time,:d_time,:doctor_id,:patient_id,:ward_id  ,presence: true
  # validate :stay_time
  

  def stay_time
    # debugger
      # time = self.d_time - self.a_time

     if Time.now > self.a_time
      errors.add(:a_time, "Admission time must be after the current date")
    
    elsif Time.now > self.d_time
     errors.add(:d_time, "Discahrge time must be after the current date")
  
    elsif self.a_time > self.d_time
      errors.add(:end_time, "Discharge time must be greater than admission time")
    
    end

  end

end
