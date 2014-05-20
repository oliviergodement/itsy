class Product < ActiveRecord::Base
  belongs_to :category
  has_many :pictures
  accepts_nested_attributes_for :pictures
end
