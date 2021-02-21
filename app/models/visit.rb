class Visit < ApplicationRecord
  belongs_to :dog
  belongs_to :park
  has_many :visit_playdates
  has_many :playdates, through: :visit_playdates
end
