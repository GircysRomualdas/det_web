class OrderPrepsController < ApplicationController 
    before_action :authenticate_user!

    def index 
        print("\n--- OrderPreps index ---\n")
        @order_prep = OrderPrep.where(user: current_user).first
        @pagy, @details = pagy(DetailPrep.where(order_prep: OrderPrep.where(user: current_user).first))
    end

    def show 
        print("\n--- OrderPreps show ---\n")
    end

    def new 
        print("\n--- OrderPreps new ---\n")
    end

    def create 
        print("\n--- OrderPreps create ---\n")
    end

    def edit 
        print("\n--- OrderPreps edit ---\n")
    end

    def update 
        print("\n--- OrderPreps update ---\n")
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
        print("\n--- OrderPreps delete ---\n")
    end

    private 
        def order_prep_params
            params.require(:order_prep).permit(:id, :user, :brand_id)
        end
end