class SessionsController < ApplicationController
    #skip_before_action :verify_authenticity_token, only: :create
    
    def omniauth
        user = User.from_omniauth(request.env['omniauth.auth'])
        if user.valid?
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to '/login'
        end
    end

    def new
    end

    def create
        if session[:user_id]
            redirect_to '/'
##        elsif params[:username].nil? || params[:username].empty?
##            redirect_to '/login'
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