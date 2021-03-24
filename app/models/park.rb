class Park < ApplicationRecord
    has_many :visits
    has_many :dogs, through: :visits

    scope :visits_count

    def active_visits
        self.visits.active_visit
    end

    def active_visits_count
        active_visits.count
    end

    def dogs_at_park
        Dog.joins(:visits).where({visits: {active_visit: true, park: self}})
    end

    def most_visits
        Park.joins(:visits).group("parks.id").order("count(visits.id) DESC")
    end

end
