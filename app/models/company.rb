class Company < ApplicationRecord
  validates :description,  length: { maximum: 150 }

  ratyrate_rateable "punctuality", "service", "quality"

  has_many :relations
end
