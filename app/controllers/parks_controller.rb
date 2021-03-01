class ParksController < ApplicationController

    def index
        @parks = Park.all
    end
 
    def show
        @park = Park.find(params[:id])
    end

    def edit
    end

    def update
    end

end
