class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to :department, optional: true
  has_many :stays
  has_many :appointments , dependent: :destroy
  has_many :patients, through: :appointments

  validates_format_of :name, :with => /\A[a-z . A-Z'-]*\z/ 
  validates :name,:spec,:hours,:fees,:department_id,presence: true

  # devise :database_authenticatable,
  #        :recoverable, :rememberable, :validatable

end
