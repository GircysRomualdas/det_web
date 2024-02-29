class LocalesController < ApplicationController 
    before_action :authenticate_user!

    def index 
        print("\n--- Locales index ---\n")
    end

    def show 
        print("\n--- Locales show ---\n")
    end

    def new 
        print("\n--- Locales new ---\n")
    end

    def create 
        print("\n--- Locales create ---\n")
        cookies[:locale] = params[:locale].to_sym

        redirect_to request.referrer || root_path, notice: "change locale to #{cookies[:locale]}"
    end

    def edit 
        print("\n--- Locales edit ---\n")
    end

    def update 
        print("\n--- Locales update ---\n")
    end

    def destroy 
        print("\n--- Locales delete ---\n")
    end
end