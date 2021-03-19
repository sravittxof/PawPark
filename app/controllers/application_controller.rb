class ApplicationController < ActionController::Base
    include ApplicationHelper
    before_action :redirect_if_not_logged_in
    
    helper_method :current_user, :my_current_visits

    private

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) #if session[:user_id]
    end


    def my_current_visits
        @my_current_visits = Visit.active_visit.joins(dog: :user)
    end

end