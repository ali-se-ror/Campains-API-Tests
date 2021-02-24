class Tag < ApplicationRecord
  has_many :campaign_tags, dependent: :destroy
  has_many :campaigns, through: :campaign_tags
end
