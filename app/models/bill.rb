class Bill < ApplicationRecord
belongs_to :stay, optional: true
  
  # time = Stay.d_time - Stay.a_time
  
  validates :stay_id, uniqueness: true,presence: true
  validates :bill,presence: true
  before_save :time_difference
  


  def time_difference
    seconds=self.stay.d_time - self.stay.a_time
    minutes= seconds/60
    hours= minutes/60
    cost=hours*500
    self.bill = cost
    # self.save
    # debugger

  end
end
