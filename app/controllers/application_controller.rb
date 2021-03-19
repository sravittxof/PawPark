class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?, :redirect_if_not_logged_in, :my_current_visits

    private

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) #if session[:user_id]
    end

    def logged_in?
        !!session[:user_id]
    end

    def redirect_if_not_logged_in 
        redirect_to '/' if !logged_in?
    end

    def my_current_visits
        @my_current_visits = Visit.active_visit.joins(dog: :user)
    end

end