class DogsController < ApplicationController
include DogsHelper

    def index
        @dogs = Dog.all
    end

    def show
        @dog = Dog.find(params[:id])
    end

    def new
        @dog = Dog.new(user_id: current_user.id)
    end

    def create
        binding.pry
        @dog = Dog.new(dog_params)
        @dog.user = current_user
        if @dog.save
            redirect_to dog_path(@dog)
        else
            render :new
        end
    end

    def edit
        @dog = Dog.find(params[:id])
    end

    def update
        @dog = Dog.find(params[:id])
        if edit_dog_allowed?(@dog) && @dog.update(dog_params)
            redirect_to dog_path(@dog)
        else
            flash[:message] = "That's not your dog!"
            render :edit
        end
    end

    def destroy
        @dog = Dog.find(params[:id])
        if edit_dog_allowed?(@dog)
            @dog.destroy
        end
        redirect_to dogs_path
    end

    private

    def dog_params
        params.require(:dog).permit(:name, :age, :breed, :size, :user_id)
    end

end
