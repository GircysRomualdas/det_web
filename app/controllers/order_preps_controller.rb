class OrderPrepsController < ApplicationController 
    before_action :authenticate_user!

    def index 
        @order_prep = OrderPrep.where(user: current_user).first

        details = DetailPrep.where(order_prep: @order_prep)
        @q = details.ransack(params[:q])
        @pagy, @details = pagy(@q.result(distrinct: true))
    end

    def show 
    end

    def new 
    end

    def create 
        order_prep = OrderPrep.find(params[:id])
        if ApiOrdersService.new.post_order(current_user)
            DetailPrep.where(order_prep: order_prep).destroy_all
            redirect_to request.referrer || root_path, notice: "Order created"
        else 
            redirect_to request.referrer || root_path, danger: "Order not created"
        end
    end

    def edit 
    end

    def update 
        order_prep = OrderPrep.find(params[:id])
        if order_prep.update(order_prep_params)
            FindDetailPrep.where(order_prep: order_prep).destroy_all
            DetailPrep.where(order_prep: order_prep).destroy_all
            
            redirect_to request.referrer || root_path, notice: "update to  #{order_prep.brand.name}"
        else 
            redirect_to request.referrer || root_path, danger: "not update"
        end
    end

    def destroy 
    end

    private 
        def order_prep_params
            params.require(:order_prep).permit(:id, :user, :brand_id)
        end
end