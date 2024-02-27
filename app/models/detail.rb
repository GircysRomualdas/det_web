class Detail < ApplicationRecord
    belongs_to :order
    validates :part_name,  length: { maximum: 50, message: "/Name must be at most 50 characters" }
    validates :comment, length: { maximum: 50, message: "/Comment must be at most 50 characters" }

    def self.ransackable_attributes(auth_object = nil)
        ["detail_id", "icon", "id", "kiekis", "inovice_count", "onepart_price_with_tax", "our_price", "qnt", "qnt_confirmed", "qnt_packed", "woinovice_count", "order_id", "part_code", "part_name", "price_with_tax", "price_wo_tax_all", "comment", "status", "supplier"]
    end

    def self.ransackable_associations(auth_object = nil)
        []
    end
end
