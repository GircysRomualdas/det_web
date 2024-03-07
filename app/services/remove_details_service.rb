class RemoveDetailsService 
    def find_from_details(current_user) 
        order_prep = OrderPrep.where(:user => current_user).first
        detail_prep = DetailPrep.where(:order_prep => order_prep) 
        more_detail = FindDetailPrep.where(:order_prep => order_prep)
        
        more_detail.each do |detail| 
            if detail_prep.any? { |prep| prep[:detail_id] == detail.detail_id }
                more_detail.delete(detail)
            end
        end
    end
end