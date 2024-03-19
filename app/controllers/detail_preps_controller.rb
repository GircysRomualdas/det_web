class DetailPrepsController < ApplicationController 
    before_action :authenticate_user!

    def index 
    end

    def show 
    end

    def new 
    end

    def create 
        if params[:add_all]
            findDetailPreps = FindDetailPrep.where(order_prep: OrderPrep.where(user: current_user).first)
        else 
            findDetailPreps = FindDetailPrep.where(id: params[:id])
        end

        info = ""
        warning = ""

        findDetailPreps.each do |findDetailPrep|
            detailPrep = DetailPrep.where(detail_id: findDetailPrep.detail_id).first_or_initialize
            response = detailPrep.update!( 
                order_prep: OrderPrep.where(user: current_user).first,
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

            if response 
                info += "#{findDetailPrep.car_name} | #{findDetailPrep.code} | #{findDetailPrep.price} | #{findDetailPrep.quantity}\n"
            else
                warning += "#{findDetailPrep.car_name} | #{findDetailPrep.code} | #{findDetailPrep.price} | #{findDetailPrep.quantity}\n"
            end
        end

        info != "" ? flash[:info] = info : print("info")
        warning != "" ? flash[:warning] = warning : print("warning")

        redirect_to request.referrer || root_path 
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
        if params[:remove_all]
            DetailPrep.where(order_prep: OrderPrep.where(user: current_user).first).destroy_all
        else 
            DetailPrep.find(params[:id]).destroy
        end

        redirect_to request.referrer || root_path, notice: "remove"
    end

    private 
        def detail_params
            params.permit(:code, :name, :comment, :quantity)
        end
end