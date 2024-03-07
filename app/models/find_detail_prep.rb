class FindDetailPrep < ApplicationRecord
    belongs_to :order_prep
    
    validates :name,  length: { maximum: 50, message: "/Name must be at most 50 characters" }
    validates :comment, length: { maximum: 50, message: "/Comment must be at most 50 characters" }
    validates :quantity, numericality: { greater_than: 0, less_than_or_equal_to: 1000 }

    def self.ransackable_attributes(auth_object = nil)
        [
            "detail_id",
            "car_id",
            "car_name",
            "supplier_id",
            "supplier_name",
            "order_type_id",
            "order_type_name",
            "delivery_days",
            "code",
            "name",   
            "comment",
            "price",
            "price_with_tax",
            "quantity"
        ]
    end

    def self.ransackable_associations(auth_object = nil)
        []
    end
end
