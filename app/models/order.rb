class Order < ApplicationRecord
    has_many :details

    before_save :update_color
    
    def self.ransackable_attributes(auth_object = nil)
        [
            "sid",
            "client_id",
            "client",
            "vehicle_brand",
            "vehicle_model",
            "vin",
            "status",
            "creation_date",
            "color",
            "icon",
            "supplierlist",
            "codelist",
            "dtcreation_date",
            "sum_price_wo_tax_all",
            "count_ordered_parts",
            "count_canceled_parts",
            "count_changed_price_parts"
        ]
    end

    def self.ransackable_associations(_auth_object = nil)
        []
    end

    private

    def update_color
        self.color = color.gsub('</div>', '</div><span class="progress-count">').gsub('</td>', '</span></td>')
    end
end
