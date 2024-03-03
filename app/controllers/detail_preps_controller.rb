class DetailPrepsController < ApplicationController 
    before_action :authenticate_user!

    def index 
    end

    def show 
    end

    def new 
    end

    def create 
        findDetailPrep = FindDetailPrep.find(params[:id])
        detailPrep = DetailPrep.where(detail_id: findDetailPrep.detail_id).first_or_initialize

        detailPrep.update!( 
            order_prep: OrderPrep.where(user: current_user).first,
            # detail_id: findDetailPrep.detail_id,
            car_id: findDetailPrep.car_id,
            car_name: findDetailPrep.car_name,
            supplier_id: findDetailPrep.supplier_id,
            supplier_name: findDetailPrep.supplier_name,
            order_type_id: findDetailPrep.order_type_id,
            order_type_name: findDetailPrep.order_type_name,
            delivery_days: findDetailPrep.delivery_days,
            code: findDetailPrep.code,
            name: findDetailPrep.name,                       
            comment: findDetailPrep.comment,           
            price: findDetailPrep.price,
            price_with_tax: findDetailPrep.price_with_tax,
            quantity: findDetailPrep.quantity
        )

        redirect_to request.referrer || root_path, notice: "add detail to order name: #{findDetailPrep.car_name} code: #{findDetailPrep.code} price: #{findDetailPrep.price} quantity #{findDetailPrep.quantity}"
    end

    def edit 
    end

    def update 
        @detail_prep = DetailPrep.find(params[:id])
        if @detail_prep.update(detail_params)
            flash.now[:success] = "Updated to #{detail_params}"
            render json: { success: true, flash: flash.now }
        else
            flash.now[:danger] = "Updated not to #{detail_params} error: #{@detail_prep.errors.full_messages}"
            render json: { success: false, flash: flash.now }
        end
    end

    def destroy 
        DetailPrep.find(params[:id]).destroy
        redirect_to request.referrer || root_path, notice: "remove"
    end

    private 
        def detail_params
            params.permit(:code, :name, :comment, :quantity)
        end
end