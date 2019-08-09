class Patient < ApplicationRecord
  
  # belongs_to :department, optional: true
  # belongs_to :ward,optional: true
  has_many :stays
  has_many :appointments,dependent: :destroy
  has_many :doctors, through: :appointments

  # devise :database_authenticatable,
  #        :recoverable, :rememberable, :validatable
  validates_format_of :name, :with => /\A[a-z A-Z'-]*\z/ 
  validates :name,:age,:weight,:dis,:phone,:address,:department_id ,presence: true
  

end
