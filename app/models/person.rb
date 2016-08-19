class Person < ApplicationRecord
  validates :description,  length: { maximum: 150 }

  ratyrate_rateable "punctuality", "performance", "personal_image"

  has_many :relations
end
