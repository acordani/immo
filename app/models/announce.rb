class Announce < ActiveRecord::Base
  belongs_to :user
  belongs_to :property

  validates :title, presence: true
  validates :property_id, presence: true
  validates :description, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
