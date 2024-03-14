require 'json'

class ApiDetailsService 

    def get_detail_by_code(codes, current_user)
        body = {}
        body["client_id"] = current_user.company_id
        body["codes"] = []

        codes.each do |code|
            body["codes"].push(
                "code": code
            )
        end

        response = HTTParty.post('https://dev.detaliutiekimas.lt/ords/dev/web/getDetailsByCodes', :verify => false, :headers => {"Content-Type": "application/json"}, :body => body.to_json)
        
        return response["details"]
    end
end