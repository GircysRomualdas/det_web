class DetailPrep < ApplicationRecord
    belongs_to :order_prep
    validates :name,  length: { maximum: 50, message: "/Name must be at most 50 characters" }
    validates :comment, length: { maximum: 50, message: "/Comment must be at most 50 characters" }

    def self.ransackable_attributes(auth_object = nil)
        ["car_id", "car_name", "code", "created_at", "detail_id", "id", "name", "order_prep_id", "order_type_id", "order_type_name", "price", "quantity", "delivery_days", "comment", "supplier_id", "supplier_name", "updated_at"]
    end

    def self.ransackable_associations(auth_object = nil)
        []
    end
end
