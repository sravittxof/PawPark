module DogsHelper

    def edit_dog_allowed?(dog)
        dog.user == current_user
    end
end
