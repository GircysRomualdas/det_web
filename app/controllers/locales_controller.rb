class LocalesController < ApplicationController 
    # before_action :authenticate_user!

    def index 
    end

    def show 
    end

    def new 
    end

    def create 
        cookies[:locale] = params[:locale].to_sym

        redirect_to request.referrer || root_path, notice: "change locale to #{cookies[:locale]}"
    end

    def edit 
    end

    def update 
    end

    def destroy 
    end
end