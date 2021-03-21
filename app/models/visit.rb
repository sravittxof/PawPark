class Visit < ApplicationRecord
  belongs_to :dog
  belongs_to :park
  has_many :visit_playdates
  has_many :playdates, through: :visit_playdates


  scope :active_visit, -> { where(active_visit: true) }

  def visiting_dog_name
    self.dog.name
  end

  def self.active_visits_by_park(park_id)
    self.active_visit.where(park: park_id)
  end


end
