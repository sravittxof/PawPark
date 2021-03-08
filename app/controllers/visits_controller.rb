class VisitsController < ApplicationController

    def new
        @visit = Visit.new(park_id: params[:park_id])
    end

    def create
        binding.pry
        @visit = Visit.new(visit_params)
        binding.pry
        if @visit.save
            redirect_to park_path(@visit.park)
        else
            redirect_to parks_path            
        end
    end

    def edit
    end

    def update
    end

    private

    def visit_params
        params.require(:visit).permit(:dog_id, :park_id, :active_visit)
    end

end
