class ParksController < ApplicationController
    include ParksHelper
    
    def index
        @parks = Park.all
    end
    
    def show
        @park = Park.find(params[:id])
        #@dogs_at_park = dogs_at_park(@park)
    end

    def edit
    end

    def update
    end

end
