class SubscriptionSerializer < ActiveModel::Serializer
  attributes :id, :subreddit, :sub_type, :user_id
end
