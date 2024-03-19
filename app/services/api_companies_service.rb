
class ApiCompaniesService 
    def get_all_companies
        auth = {:username => Rails.application.credentials.dig(:api_basic_auth, :username), :password => Rails.application.credentials.dig(:api_basic_auth, :password)}
        response = HTTParty.get('https://dev.detaliutiekimas.lt/ords/dev/web/getAllCompanies', :verify => false, :basic_auth => auth)

        return response["companies"]
    end
end
