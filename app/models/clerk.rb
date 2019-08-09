class Clerk < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_format_of :name, :with => /\A[a-z A-Z'-]*\z/ 
  validates :age,:name,:time,presence: true
  # validate :end_date_after_start_date

  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
 


  def end_date_after_start_date

    if Time.now > self.time
      errors.add(:time, "must be after the current date")
    end
  
   end

end
