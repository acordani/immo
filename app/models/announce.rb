class Announce < ActiveRecord::Base
  belongs_to :user
  belongs_to :property
  has_many :pictures, dependent: :destroy

  validates :title, presence: true
  validates :property_id, presence: true
  validates :description, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  accepts_nested_attributes_for :pictures, reject_if: lambda { |c| c['picture'].nil? }
end
