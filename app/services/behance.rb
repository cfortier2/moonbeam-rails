require "net/http"

class Behance
  def self.current_sha
    Net::HTTP.get(URI("http://behance.net/sha.txt")).chomp
  end
end
