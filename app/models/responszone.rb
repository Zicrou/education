class Responszone < ApplicationRecord
  belongs_to :user
  belongs_to :country
  belongs_to :region
  belongs_to :departement

  validates_presence_of :user_id, :user_responszone, :telephone, :cni, :photocni, :photo, :country_id, :region_id, :departement_id

  mount_uploader :photocni, ResponsZoneUploader
  mount_uploader :photo, ResponsZoneUploader
end
