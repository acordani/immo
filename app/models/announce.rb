class Announce < ActiveRecord::Base
  belongs_to :user
  belongs_to :property

  validates :title, presence: true
  validates :property_id, presence: true
  validates :description, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  has_attached_file :picture1,
    styles: { medium: "300x300>", thumb: "100x100>" }



  validates_attachment_content_type :picture1, content_type: /\Aimage\/.*\z/
  validates_attachment_size :picture1, less_than: 5.megabytes

  has_attached_file :picture2,
    styles: { medium: "300x300>", thumb: "100x100>" }



  validates_attachment_content_type :picture2, content_type: /\Aimage\/.*\z/
  validates_attachment_size :picture2, less_than: 5.megabytes


  has_attached_file :picture3,
    styles: { medium: "300x300>", thumb: "100x100>" }



  validates_attachment_content_type :picture3, content_type: /\Aimage\/.*\z/
  validates_attachment_size :picture3, less_than: 5.megabytes


 has_attached_file :picture4,
    styles: { medium: "300x300>", thumb: "100x100>" }



  validates_attachment_content_type :picture4, content_type: /\Aimage\/.*\z/
  validates_attachment_size :picture4, less_than: 5.megabytes

def self.search(keywords)
    announces = order(:locality)
    announces = announces.where("locality like ?", "%#{slocality}%") if keywords.present?
    announces
  end


end
