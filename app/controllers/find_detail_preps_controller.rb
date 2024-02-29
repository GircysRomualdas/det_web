class FindDetailPrepsController < ApplicationController 
    before_action :authenticate_user!
    
    def index 
        print("\n--- FindDetailPreps index ---\n")
        RemoveDetailsService.new.find_from_details(current_user)
        @order_prep = OrderPrep.where(user: current_user).first
        @pagy, @find_details = pagy(FindDetailPrep.where(order_prep: @order_prep))
    end

    def show 
        print("\n--- FindDetailPreps show ---\n")
    end

    def new 
        print("\n--- FindDetailPreps new ---\n")
    end

    def create 
        print("\n--- FindDetailPreps create ---\n")
        param = detail_params
        details = ApiDetailsService.new.get_detail_by_code(param[:code], current_user)
        info = ""
        warning = ""
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
                    name: nil, 
                    comment: nil,
                    price: detail["price"],
                    quantity: detail["quantity"]
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
        print("\n--- FindDetailPreps edit ---\n")
    end

    def update 
        print("\n--- FindDetailPreps update ---\n")
    end

    def delete 
        print("\n--- FindDetailPreps index ---\n")
    end

    private 
        def detail_params
            params.permit(:code, :name)
        end
end