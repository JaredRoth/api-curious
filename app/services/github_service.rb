class GithubService
  def initialize(user)
    @user = user
    @connection = Faraday.new(url: "https://api.github.com/")
    # @connection.headers["Authorization"] = "token #{@user.oauth_token}"
  end

  def get_info
    @connection.get "users/#{@user.username}"
  end

  def user_info
    parse(get_info)
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
