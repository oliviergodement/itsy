class Picture < ActiveRecord::Base
  has_attached_file :s3picture, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :s3picture, :content_type => /\Aimage\/.*\Z/
  belongs_to :product
  belongs_to :category
end
