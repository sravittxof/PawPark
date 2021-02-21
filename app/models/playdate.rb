class Playdate < ApplicationRecord
    has_many :visit_playdates
    has_many :visits, through: :visit_playdates
    has_many :dogs, through: :visits
end
