class SessionsController < ApplicationController

    def new
    end
    
    def create
        if session[:user_id]
            redirect_to '/'
        elsif params[:username].nil? || params[:username].empty?
            redirect_to '/login'
        else
            user = User.find_by(username: params[:username])
            if user && user.authenticate(params[:password])
                session[:user_id] = user.id
                redirect_to "/users/#{user.id}"
            else
                flash[:message] = "Please enter correct username and password."
                redirect_to '/login'
            end
        end
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end

end