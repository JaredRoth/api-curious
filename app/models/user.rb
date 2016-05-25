class User < ActiveRecord::Base
  def self.from_omniauth(auth_info)
    user = where(username: auth_info.info.nickname).first_or_create do |new_user|
      new_user.username = auth_info.info.nickname
    end
    user.oauth_token        = auth_info.credentials.token
    user.oauth_token_secret = auth_info.credentials.secret
    user.save
    user
  end
end
