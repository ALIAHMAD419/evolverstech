class Room < ApplicationRecord
    has_many :appointments , dependent: :destroy
    validates :room,presence: true

end
