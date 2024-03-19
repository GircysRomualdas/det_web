
class ApiBrandsService 
    def get_all_brands
        auth = {:username => Rails.application.credentials.dig(:api_basic_auth, :username), :password => Rails.application.credentials.dig(:api_basic_auth, :password)}
        response = HTTParty.get('https://dev.detaliutiekimas.lt/ords/dev/web/getAllBrands', :verify => false, :basic_auth => auth)

        return response["brands"]
    end
end