class VisitsController < ApplicationController
    #before_action :current_user_dog?, only: [:create, :edit, :update]
    include VisitsHelper

    def index
    
    end

    def show

    end

    def new
        @visit = Visit.new(park_id: params[:park_id])
    end

    def create       
        @visit = Visit.new(visit_params)
        if create_visit_allowed?(@visit)
            @visit.active_visit = true
            if @visit.save
                redirect_to park_path(@visit.park)
            else
                render :new
            end
        else
            flash[:message] = "Dog cannot have two visits at same time."
            render :new
        end
    end

    def edit
        @visit = Visit.find(params[:id])
    end

    def update
        @visit = Visit.find(params[:id])
        if @visit.dog.user_id == current_user.id && @visit.update(active_visit: false)
            redirect_to parks_path
        else
            render park_path(@visit.park)
        end
    end

    private

    def visit_params
        params.require(:visit).permit(:dog_id, :park_id, :id)
    end

end
