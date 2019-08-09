class Bed < ApplicationRecord
  belongs_to :ward, optional: true
  validates :ward_id,:beds, presence: true


end
