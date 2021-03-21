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



    def count_dogs_at_park(park)
        park.dogs_at_park.count
    end



end
