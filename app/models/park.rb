class Park < ApplicationRecord
    has_many :visits
    has_many :dogs, through: :visits
end
