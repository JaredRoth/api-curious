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

  def info
    GithubService.new(self).user_info
  end

  # def commit_total
  #   event_hash = GithubService.new(self).event_info
  #   event_hash.map do |event|
  #     if event[:type] == "PushEvent" || event[:type] == "CreateEvent"
  #       event[:payload][:size]
  #     end
  #   end.compact.reduce(:+)
  # end

  def repos
    event_hash = GithubService.new(self).event_info
    event_hash.each_with_object(Hash.new(0)) do |event, hash|
      if event[:type] == "PushEvent" || event[:type] == "CreateEvent"
        hash[event[:repo][:name]] += 1
      end
    end
  end

  def followed_activity(username)
    event_hash = GithubService.new(self).followed_info(username)
    event_hash.each_with_object(Hash.new(0)) do |event, hash|
      if event[:type] == "PushEvent" || event[:type] == "CreateEvent"
        hash[event[:repo][:name]] += 1
      end
    end
  end

  def following
    list = GithubService.new(self).followed_list
    list.map do |info|
      {username: info[:login], avatar: info[:avatar_url]}
    end
  end
end
