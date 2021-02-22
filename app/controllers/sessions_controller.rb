class SessionsController < ApplicationController

    def new
    end
    
    def create
        if session[:user_id]
            redirect_to 'welcome/home'
        elsif params[:username].nil? || params[:username].empty?
            redirect_to '/login'
        else
           session[:user_id] = User.find_by(username: params[:username]).id
           redirect_to '/'
        end
    end

    def destroy
        session.delete :user_id
    end

end