class ParksController < ApplicationController
    include ParksHelper
    
    def index
        @parks = Park.all
    end
    
    def show
        @park = Park.find(params[:id])
    end

    def most_visits
        @park = Park.find_by_sql("SELECT * FROM parks INNER JOIN visits ON visit.park_id = park.id GROUP BY park.id ORDER BY COUNT(visits.id) DESC")
    end

    def edit
    end

    def update
    end

end
