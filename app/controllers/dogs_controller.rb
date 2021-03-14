class DogsController < ApplicationController


    def index
        if params[:user_id] && params[:user_id] == current_user.id.to_s
            @dogs = current_user.dogs
        else
            @dogs = Dog.all
        end
    end

    def show
        @dog = Dog.find(params[:id])
    end

    def new
        @dog = Dog.new(user_id: current_user.id)
    end

    def create
        @dog = Dog.new(dog_params)
        @dog.user = current_user
        if @dog.save
            redirect_to dog_path(@dog)
        else
            render :new
        end
    end

    private

    def dog_params
        params.require(:dog).permit(:name, :age, :breed, :size, :user_id)
    end

end
