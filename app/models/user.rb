class User < ApplicationRecord
  has_many :subscriptions

  before_create -> { self.auth_token = SecureRandom.hex }
end
