class GithubService
  def initialize#(user)
    @connection = Faraday.new(url: "https://api.github.com/")
    @connection.headers["Authorization"] = "token 'token'"
  end

  def get_user_info
    @connection.get "user/#{user.username}"
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
