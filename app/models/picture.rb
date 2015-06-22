class Picture < ActiveRecord::Base
  belongs_to :announce

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>", cover: "1200x600" }



  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  validates_attachment_size :picture, less_than: 5.megabytes

end
