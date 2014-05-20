class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :pictures
end
