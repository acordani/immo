class Announce < ActiveRecord::Base

  belongs_to :user
  belongs_to :property
  has_many :pictures, dependent: :destroy

  # validates :title, presence: true
  # validates :property_id, presence: true
  validates :description, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  # accepts_nested_attributes_for :pictures, reject_if: lambda { |c| c['picture'].nil? }

  attr_accessor :form_step

  # t.string   "title"
  #   t.integer  "bed"
  #   t.integer  "bath"
  #   t.integer  "surface"
  #   t.string   "features"
  #   t.integer  "construction"
  #   t.string   "ges"
  #   t.text     "description"
  #   t.integer  "tax_month"
  #   t.integer  "user_id"
  #   t.integer  "price"
  #   t.datetime "created_at",   null: false
  #   t.datetime "updated_at",   null: false
  #   t.float    "latitude"
  #   t.float    "longitude"
  #   t.string   "address"
  #   t.string   "locality"
  #   t.integer  "property_id"
  #   t.string   "class_energy"
  #   t.string   "transports"
  #   t.string   "view"
  #   t.string   "exposition"
  #   t.string   "floor"
  #   t.string   "floor_max"
  #   t.boolean  "elevator"

  cattr_accessor :form_steps do
    %w(description photo)
  end

  with_options :if => -> { required_for_step?(:description) } do |step|
    # step.validates :title, :presence => true
    step.validates :bed, :presence => true, :numericality => true
    step.validates :bath, :presence => true, :numericality => true
    step.validates :surface, :presence => true, :numericality => true
    step.validates :class_energy, :presence => true
    step.validates :description, :presence => true
    # step.validates :suffix, :presence => true
  end

  with_options :if => -> { required_for_step?(:photo) } do |step|
    step.validates :picture, :attachment_presence => true
    accepts_nested_attributes_for :pictures, reject_if: lambda { |c| c['picture'].nil? }

  end



  private
    def required_for_step?(step)
      # All fields are required if no form step is present
      return true if form_step.nil?

      # All fields from previous steps are required if the
      # step parameter appears before or we are on the current step
      self.form_steps.index(step.to_s) <= self.form_steps.index(form_step)
    end
end