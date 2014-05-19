class Category < ActiveRecord::Base

  has_many :products
  has_many :pictures, through: :products

end
