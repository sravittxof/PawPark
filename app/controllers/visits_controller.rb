class VisitsController < ApplicationController

    def index
    
    end

    def show

    end

    def new
        @visit = Visit.new(park_id: params[:park_id])
    end

    def create
        binding.pry
        @visit = Visit.new(visit_params)
        @visit.active_visit = true
        binding.pry
        if @visit.save
            redirect_to park_path(@visit.park)
        else
            redirect_to parks_path            
        end
    end

    def edit
        binding.pry
        @visit = Visit.find_by(id: params[:id])
        # current_user.dogs.each do |dog|
        #     visit = dog.visits.last
        #     if visit.active_visit
        #         @visit << visit #if visit.active_visit
        #     end
        # end

    end

    def update
        binding.pry
        @visit = Visit.find(params[:id])
        binding.pry
        if @visit.update(active_visit: false)
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
