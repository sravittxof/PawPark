class SessionsController < ApplicationController
    #skip_before_action :verify_authenticity_token, only: :create
    #skip_before_action :redirect_if_not_logged_in, only: [:new, :create, :omniauth]
    

    def omniauth
        user = User.from_omniauth(request.env['omniauth.auth'])
        if user.valid?
            session[:user_id] = user.id
            redirect_to root_path
        else
            redirect_to '/login'
        end
    end

    def new
    end

    def create
        user = User.find_by(username: params[:username])
        binding.pry
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path
        else
            flash[:message] = "Please enter correct username and password."
            redirect_to '/login'
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

end