class Staff < ApplicationRecord
  belongs_to :ward, optional: true
  validates :name,:time,:age,:duty,:floor,:ward_id ,presence: true
  validates_format_of :name, :with => /\A[a-z A-Z'-]*\z/ 

  # validate :end_date_after_start_date

  

  def end_date_after_start_date

    if Time.now > self.time

      errors.add(:time, message:  "must be after the current date")

    end
  end
end
