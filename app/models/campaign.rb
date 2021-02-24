class Campaign < ApplicationRecord
  belongs_to :user
  enum duration: [:within_one_week, :witin_one_month, :within_three_months]
  has_many :campaign_tags
  has_many :tags, through: :campaign_tags
  accepts_nested_attributes_for :campaign_tags
  has_many :comments, as: :commentable
  has_many :topics
end
