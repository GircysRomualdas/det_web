class ApiDetailsService 
    def get_detail_by_code(code, current_user)
        response = HTTParty.get('https://dev.detaliutiekimas.lt/ords/dev/web/getDetailByCode', :verify => false, :headers => {:code => code.to_s, :client_id => current_user.company_id.to_s})
        
        return response["detail"]
    end
end