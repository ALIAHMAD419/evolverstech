class Ward < ApplicationRecord
  belongs_to :department, optional: true
  has_many :staffs
  has_many :stays
  has_many :beds
  validates :wards_name,:department_id  ,presence: true

  # has_many :patients, through: :departments
end
