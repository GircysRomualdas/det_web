class OrdersController < ApplicationController 
    before_action :authenticate_user!

    def index 
        print("\n--- Orders index ---\n")
        @pagy, @orders = pagy(Order.where(:client_id => current_user.company_id))
    end

    def show 
        print("\n--- Orders show ---\n")
        @order = Order.find_by(id: params[:id], client_id: current_user.company_id)
        @pagy, @details = pagy(Detail.where(order_id: @order.id))
    end

    def new 
        print("\n--- Orders new ---\n")
    end

    def create 
        print("\n--- Orders create ---\n")
    end

    def edit 
        print("\n--- Orders edit ---\n")
    end

    def update 
        print("\n--- Orders update ---\n")
    end

    def destroy 
        print("\n--- Orders delete ---\n")
    end
end