class LocalesController < ApplicationController 
    def index 
    end

    def show 
    end

    def new 
    end

    def create 
        cookies[:locale] = params[:locale].to_sym

        redirect_to request.referrer || root_path
    end

    def edit 
    end

    def update 
    end

    def delete 
    end
end