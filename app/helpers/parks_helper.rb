module ParksHelper




    def active_visits_by_park_dog_user(park)
        Visit.active_visit.joins(dog: :user).where({ park: park, dog: {user: current_user} })
    end

    
    def count_dogs_at_park(park)
        park.dogs_at_park.count
    end


end
