class OrderPrep < ApplicationRecord
    belongs_to :user
    belongs_to :brand
    
    has_many :detail_preps
    has_one :find_detail_prep
end
