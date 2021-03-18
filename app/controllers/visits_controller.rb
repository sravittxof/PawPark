class VisitsController < ApplicationController

    def index
    
    end

    def show

    end

    def new
        park = Park.find(params[:park_id])
        if park
            @visit = Visit.new(park_id: params[:park_id])
        else
            redirect_to parks_path
        end
    end

    def create
        # @visit = Visit.new(visit_params)
        # @visit.active_visit = true
        # if @visit.save
        #     redirect_to park_path(@visit.park)
        # else
        #     redirect_to parks_path            
        # end
        binding.pry
        @visit = Visit.new(visit_params)
        if Park.find(@visit.park.id) && @visit.dog.user_id == current_user.id
            @visit.active_visit = true
            if @visit.save
                redirect_to park_path(@visit.park)
            else
                render :new
            end
        else
            redirect_to parks_path
        end
    end

    def edit
        binding.pry
        #@visit = Visit.find_by(id: params[:id])
        visit = Visit.find(params[:id])
        if visit && visit.dog.user_id == current_user.id
            @visit = visit
        else
            redirect_to parks_path
        end
    end

    def update
        binding.pry
        # @visit = Visit.find(params[:id])
        # binding.pry
        # if @visit.update(active_visit: false)
        #     redirect_to parks_path
        # else
        #     render park_path(@visit.park)
        # end
        @visit = Visit.find(params[:id])
        if @visit && @visit.dog.user_id == current_user.id
            @visit.update(active_visit: false)
            redirect_to parks_path
        else
            render park_path(@visit.park)
        end
    end

    private

    def visit_params
        params.require(:visit).permit(:dog_id, :park_id, :active_visit, :id)
    end

end
