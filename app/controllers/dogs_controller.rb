class DogsController < ApplicationController

    def index
        if params[:user_id] && @user = User.find_by(id: params[:user_id])
            @dogs = @user.dogs.all
        else
            @dogs = Dog.all
        end
    end

    def show
        @dog = Dog.find(params[:id])
    end


    private

    def dogs_params
        params.require()
    end

end
