class Announce < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :type_property, presence: true
  validates :description, presence: true
end
