class Patient < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  has_many :appointments,dependent: :destroy
  has_many :doctors, through: :appointments

  validates_format_of :name, :with => /\A[a-z A-Z'-]*\z/ 
  validates :name, :age, :weight, :dis, :phone, :address ,presence: true
end
