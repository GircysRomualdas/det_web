class Order < ApplicationRecord
    has_many :details
    before_save :update_color
    
    def self.ransackable_attributes(auth_object = nil)
        ["client", "codelist", "color", "creation_date", "dtcreation_date", "icon", "id", "count_canceled_parts", "count_changed_price_parts", "count_ordered_parts", "sum_price_wo_tax_all", "order_id", "sid", "status", "supplierlist", "vehicle_brand", "vehicle_model", "vin"]
    end

    def self.ransackable_associations(_auth_object = nil)
        []
    end

    private

    def update_color
        self.color = color.gsub('</div>', '</div><span class="progress-count">').gsub('</td>', '</span></td>')
    end
end
