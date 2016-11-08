class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods

  private
  def authenticate_user_from_token
    unless authenticate_with_http_token { |token, options| User.find_by(auth_token: token) }
      render json: { error: 'Bad Token' }, status: 401
    end
  end

  public
  def default_serializer_options
    { root: false }
  end

  def token
    authenticate_with_http_basic do |email, password|
      user = User.find_by(email: email)
      if user && user.password == password
        render json: { token: user.auth_token }
      else
        render json: { error: 'Incorrect credentials' }, status: 401
      end
    end
  end

  def index
    render file: Rails.public_path.join('index.html'), layout: false
  end

  def self.generate_daily_emails
    Rails.logger.debug('aaa')
    subscriptions = Subscription.where(sub_type: 'daily')
    subscriptions.each do |subscription|
      user = subscription.user
      response = Unirest.get "http://reddit.com/r/#{subscription.subreddit}/top.json?limit=3&t=day"
      # TODO: actually send email
    end
  end

end
