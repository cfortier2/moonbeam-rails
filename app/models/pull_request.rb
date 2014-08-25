class PullRequest
  attr_reader :data

  def initialize(hash)
    @data = hash
  end

  def number
    data[:number]
  end

  def title
    data[:title]
  end

  def branch_name
    data[:head][:ref]
  end

  def opener
    data[:user][:login]
  end

  def opener_image
    data[:user][:avatar_url]
  end
end
