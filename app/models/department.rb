class Department < ApplicationRecord
  validates :name, presence: true
  has_many :doctors
  # has_many :patients
  # has_many :clerks
  # has_many :staffs
  has_many :wards

end
