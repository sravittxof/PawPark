class Park < ApplicationRecord
    has_many :visits
    has_many :dogs, through: :visits


    def active_visits
        self.visits.active_visit
    end

    def active_visits_count
        active_visits.count
    end

    def dogs_at_park
        Dog.joins(:visits).where({visits: {active_visit: true, park: self}})
    end


end
