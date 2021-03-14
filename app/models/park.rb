class Park < ApplicationRecord
    has_many :visits
    has_many :dogs, through: :visits


    def active_visits
        self.visits.active_visit
    end

    def active_visits_count
        active_visits.count
    end

end
