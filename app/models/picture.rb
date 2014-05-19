class Picture < ActiveRecord::Base
  belongs_to :product
  belongs_to :category, through: :product
end
