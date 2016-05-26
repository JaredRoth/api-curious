class GithubService
  def initialize(user)
    @user = user
    @connection = Faraday.new(url: "https://api.github.com/")
    # @connection.headers["Authorization"] = "token #{@user.oauth_token}"
  end

  def user_info
    parse(get_user_info)
  end

  def event_info
    parse(get_event_info)
  end

  def followed_list
    parse(get_followed_list)
  end

  def followed_info(username)
    parse(get_followed_info(username))
  end

  private

    def get_user_info
      @connection.get "users/#{@user.username}"
    end

    def get_event_info
      @connection.get "users/#{@user.username}/events"
    end

    def get_followed_list
      @connection.get "users/#{@user.username}/following"
    end

    def get_followed_info(username)
      @connection.get "users/#{username}/events"
    end

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
