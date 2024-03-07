class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
  
  has_many :order_preps
  has_many :detail_preps, through: :order_preps
end
