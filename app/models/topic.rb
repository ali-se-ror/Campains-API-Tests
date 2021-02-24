class Topic < ApplicationRecord
  belongs_to :user
  belongs_to :campaign
  before_create :single_topic
  has_many :comments, as: :commentable

  def single_topic
    errors.add(:not_allowed, 'topic exist against this campaign') if Topic.where(user_id: user_id, campaign_id: campaign_id).exists?
  end
end
