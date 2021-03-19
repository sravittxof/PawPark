class ParksController < ApplicationController
    before_action :redirect_if_not_logged_in
    
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
