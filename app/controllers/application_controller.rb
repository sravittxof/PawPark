class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?, :current_visit

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

    def current_visit
        user_dog_visits = current_user.dogs.all.map { |dog| dog.visits.all.last.active_visit }
    end

end
