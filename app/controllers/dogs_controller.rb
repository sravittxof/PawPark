class DogsController < ApplicationController


    def index
        # if params[:user_id] && @user = User.find_by(id: params[:user_id])
        #     @dogs = @user.dogs.all
        # else
        #     @dogs = Dog.all
        # end
        @dogs = Dog.all
    end

    def show
        binding.pry
        @dog = Dog.find(params[:id])
    end

    def new
        @dog = Dog.new
    end

    def create
        binding.pry
        @dog = Dog.new(dog_params)
        if @dog.save
            redirect_to dog_path(@dog)
        else
            render :new
        end
    end

    private

    def dog_params
        params.permit(:dog)
    end

end
