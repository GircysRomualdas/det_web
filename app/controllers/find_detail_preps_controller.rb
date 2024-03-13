class FindDetailPrepsController < ApplicationController 
    before_action :authenticate_user!
    
    def index 
        RemoveDetailsService.new.find_from_details(current_user)
        @order_prep = OrderPrep.where(user: current_user).first

        find_details = FindDetailPrep.where(order_prep: @order_prep)
        @q = find_details.ransack(params[:q])
        @pagy, @find_details = pagy(@q.result(distrinct: true))
    end

    def show 
    end

    def new 
    end

    def create 
        param = detail_params
        codes = param[:code].split(/\n/)
        name = param[:name] ? param[:name].split(/\n/) : []
        quantity = param[:quantity] ? param[:quantity].split(/\n/) : []
        comment = param[:comment] ? param[:comment].split(/\n/) : []
        preps = {}
        info = ""
        warning = ""

        codes.each_with_index do |code, index|
            preps[code] = {
                "name": name[index],
                "quantity": quantity[index].to_i > 0 ? quantity[index].to_i : 1,
                "comment": comment[index]
            }
        end

        details = ApiDetailsService.new.get_detail_by_code(codes, current_user)

        details.each do |detail| 
            created = FindDetailPrep.where(detail_id: detail["id"]).first_or_initialize
            order_prep = OrderPrep.where(user: current_user).first
            if order_prep.brand.brand_id == detail["car_id"] or order_prep.brand.group_id == Brand.where(brand_id: detail["car_id"]).first.group_id
                created.update!( 
                    order_prep: order_prep,
                    car_id: detail["car_id"], 
                    car_name: detail["car_name"], 
                    supplier_id: detail["supplier_id"], 
                    supplier_name: detail["supplier_name"], 
                    order_type_id: detail["order_type_id"], 
                    order_type_name: detail["order_type_name"],
                    delivery_days: detail["delivery_days"],
                    code: detail["code"], 
                    name: preps[detail["code"]][:name], 
                    comment: preps[detail["code"]][:comment],
                    price: detail["price"],
                    quantity: preps[detail["code"]][:quantity]
                )
                info += "find detail car: #{detail["car_name"]} code: #{detail["code"]} price: #{detail["price"]}\n"
            else 
                warning += "find detail car: #{detail["car_name"]} code: #{detail["code"]} wrong code\n"
            end
        end

        info != "" ? flash[:info] = info : print("info")
        warning != "" ? flash[:warning] = warning : print("warning")

        redirect_to request.referrer || root_path 
    end

    def edit 
    end

    def update 
        @find_detail_prep = FindDetailPrep.find(params[:id])
        if @find_detail_prep.update(detail_params)
            flash.now[:success] = "Updated to #{detail_params}"
            render json: { success: true, flash: flash.now }
        else
            flash.now[:danger] = "Updated not to #{detail_params} error: #{@find_detail_prep.errors.full_messages}"
            render json: { success: false, flash: flash.now }
        end
    end

    def delete 
    end

    private 
        def detail_params
            params.permit(:code, :name, :comment, :quantity)
        end
end