class Detail < ApplicationRecord
    belongs_to :order
    
    validates :part_name,  length: { maximum: 50, message: "/Name must be at most 50 characters" }
    validates :comment, length: { maximum: 50, message: "/Comment must be at most 50 characters" }

    def self.ransackable_attributes(auth_object = nil)
        [
            "part_name", 
            "part_code",
            "comment", 
            "kiekis",
            "qnt",
            "our_price",
            "supplier_id",
            "supplier",
            "price_wo_tax_all",
            "price_with_tax",
            "status",
            "status_id",
            "inovice_count",
            "woinovice_count",
            "icon",
            "qnt_confirmed",
            "onepart_price_with_tax",
            "qnt_packed"
        ]
    end

    def self.ransackable_associations(auth_object = nil)
        []
    end
end
