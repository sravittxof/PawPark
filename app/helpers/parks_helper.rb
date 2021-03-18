module ParksHelper

    def at_park?(park)
        my_current_visits.any? { |v| v.park_id == park.id } 
    end

    def my_current_visits_at_this_park(park)
        my_current_visits.find_all { |v| v.park_id == park.id }
    end


end
