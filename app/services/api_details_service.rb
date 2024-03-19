require 'json'

class ApiDetailsService 
    def get_detail_by_code(codes, current_user)
        auth = {:username => Rails.application.credentials.dig(:api_basic_auth, :username), :password => Rails.application.credentials.dig(:api_basic_auth, :password)}
        body = {}
        body["client_id"] = current_user.company_id
        body["codes"] = []

        codes.each do |code|
            body["codes"].push(
                "code": code
            )
        end

        response = HTTParty.post('https://dev.detaliutiekimas.lt/ords/dev/web/getDetailsByCodes', :verify => false, :headers => {"Content-Type": "application/json"}, :body => body.to_json, :basic_auth => auth)
        
        return response["details"]
    end

    def get_all_details
        auth = {:username => Rails.application.credentials.dig(:api_basic_auth, :username), :password => Rails.application.credentials.dig(:api_basic_auth, :password)}
        response = HTTParty.get('https://dev.detaliutiekimas.lt/ords/dev/web/getAllDetails', :verify => false, :basic_auth => auth)

        return response["details"]
    end
end