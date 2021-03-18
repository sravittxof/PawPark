class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?, :current_visit, :my_current_visits, #:at_park?, :my_current_visits_at_this_park# :my_dogs,

    private

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!session[:user_id]
    end

    def redirect_if_not_logged_in 
        redirect_to '/' if !logged_in?
    end

    # def current_visit
    #     user_dog_visits = current_user.dogs.all.map { |dog| dog.visits.all.last.active_visit }
    #     #@current_visit = Dog.find_by(dog.id).visits.last
    # end

    def my_current_visits
        @my_current_visits = Visit.active_visit.joins(dog: :user)
    end

    def check_out_of_park(park)
        if at_park?(park)

        end
    end

end