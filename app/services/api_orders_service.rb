require 'json'

class ApiOrdersService 
    def post_order(current_user)
        auth = {:username => Rails.application.credentials.dig(:api_basic_auth, :username), :password => Rails.application.credentials.dig(:api_basic_auth, :password)}
        order_prep = OrderPrep.where(user: current_user).first
        detail_preps = DetailPrep.where(order_prep: order_prep)
        company_id = current_user.company_id
        car_id = order_prep.brand.brand_id

        order = {}
        order["ncompany_id"] = company_id
        order["ncar_id"] = car_id
        order["details"] = []

        detail_preps.each do |detail_prep|
            order["details"].push(
                "ndetail_id": detail_prep.detail_id,
                "sname": detail_prep.name,
                "scomment": detail_prep.comment,
                "nqnt": detail_prep.quantity
            )
        end

        response = HTTParty.post('https://dev.detaliutiekimas.lt/ords/dev/web/postOrder', :verify => false, :headers => {"Content-Type": "application/json"} , :body => order.to_json, :basic_auth => auth)

        if response["nstatus"] == 1
            return true
        else
            return false
        end
    end

    def get_all_orders
        auth = {:username => Rails.application.credentials.dig(:api_basic_auth, :username), :password => Rails.application.credentials.dig(:api_basic_auth, :password)}
        response = HTTParty.get('https://dev.detaliutiekimas.lt/ords/dev/web/getAllOrders', :verify => false, :basic_auth => auth)

        return response["orders"]
    end
end