class GithubApi
  attr_reader :client

  def initialize(token)
    @client = Octokit::Client.new(access_token: token)
  end

  def open_prs
    open("behance/be.net").map { |pr| PullRequest.new(pr) }
  end

  private

  def open(repo)
    client.pull_requests(repo,
                         state: "open",
                         sort: "created",
                         direction: "desc",
                         per_page: "30")
  end

  def closed(repo)
    client.pull_requests(repo,
                         state: "closed",
                         sort: "created",
                         direction: "desc",
                         per_page: "30")
  end
end
