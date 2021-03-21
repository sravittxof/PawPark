module ParksHelper

    def at_park?(dogs)
        dogs.any? { |dog| dog.user == current_user }
    end

    # def my_current_visits_at_this_park(park)
    #     my_current_visits.find_all { |v| v.park_id == park.id }
    # end

    # def check_out_of_park(park)
    #     if park.dogs_at_park.where(user: current_user) #.any? { |dog| dog.my_dog?(current_user) }
    #         link_to "Check-Out of Park", edit_visit_path(dog.visits.last)
    #     end
    # end

    # def show_dogs_at_park(park)
    #     park.dogs_at_park.each do |dog|
    #         link_to dog.name, dog_path(dog)
    #     end
    # end

    # def dogs_not_at_park
    #     dogs = my_dogs
    # end

    # def user_dog_visits_at_park(park)
    #     Visit.joins(dog: :user).where({visits: {active_visit: true, park: park}})
    # end

    def active_visits_by_park_dog_user(park)
        Visit.active_visit.joins(dog: :user).where({ park: park, dog: {user: current_user} })
    end

    
    def count_dogs_at_park(park)
        park.dogs_at_park.count
    end


end
