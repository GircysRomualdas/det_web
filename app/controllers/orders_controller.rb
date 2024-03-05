class OrdersController < ApplicationController 
    before_action :authenticate_user!

    def index 
        @pagy, @orders = pagy(Order.where(:client_id => current_user.company_id))

        response = ApiOrderPrepsService.new.post_order(current_user)
    end

    def show 
        @order = Order.find_by(id: params[:id], client_id: current_user.company_id)
        @pagy, @details = pagy(Detail.where(order_id: @order.id))
    end

    def new 
    end

    def create 
    end

    def edit 
    end

    def update 
    end

    def destroy 
    end
end