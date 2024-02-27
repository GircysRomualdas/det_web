class FindDetailPrepsController < ApplicationController 
    def index 
        @pagy, @find_details = pagy(FindDetailPrep.all)
    end

    def show 
    end

    def new 
    end

    def create 
        param = detail_params
        details = ApiDetailsService.new.get_detail_by_code(param[:code], current_user)
        details.each do |detail| 
            created = FindDetailPrep.where(detail_id: detail["id"]).first_or_initialize
            created.update!( 
                car_id: detail["car_id"], 
                car_name: detail["car_name"], 
                supplier_id: detail["supplier_id"], 
                supplier_name: detail["supplier_name"], 
                order_type_id: detail["order_type_id"], 
                order_type_name: detail["order_type_name"],
                delivery_days: detail["delivery_days"],
                code: detail["code"], 
                # name: name[index], 
                # comment: comment[index],
                price: detail["price"]
                # quantity: quant
            )
        end

        redirect_to request.referrer || root_path, notice: "find details #{param[:code]}"
    end

    def edit 
    end

    def update 
    end

    def delete 
    end

    private 

    def detail_params
        params.permit(:code, :name)
    end
end