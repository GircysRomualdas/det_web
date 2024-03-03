class ApiOrderPrepsService
    def post_order(current_user)
        response = HTTParty.get('https://dev.detaliutiekimas.lt/ords/dev/web/postOrder', :verify => false, :headers => {})
    end
end