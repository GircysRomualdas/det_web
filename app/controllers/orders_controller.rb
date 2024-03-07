class OrdersController < ApplicationController 
    before_action :authenticate_user!

    def index 
        orders = Order.where(:client_id => current_user.company_id)
        @q = orders.ransack(params[:q])
        @pagy, @orders = pagy(@q.result(distrinct: true))
    end

    def show 
        @order = Order.find_by(id: params[:id], client_id: current_user.company_id)

        details = Detail.where(order_id: @order.id)
        @q = details.ransack(params[:q])
        @pagy, @details = pagy(@q.result(distrinct: true))
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