class OrderPrepsController < ApplicationController 
    def index 
        @pagy, @details = pagy(DetailPrep.all)
    end

    def show 
    end

    def new 
    end

    def create 
    end

    def edit 
    end

    def update 
    end

    def delete 
    end
end