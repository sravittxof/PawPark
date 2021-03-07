class VisitsController < ApplicationController

    def new
        @vist = Vist.new
        #binding.pry
    end

    def create
        @visit = Visit.new(params)
        if @visit.save
        
        else

        end

    end



end
