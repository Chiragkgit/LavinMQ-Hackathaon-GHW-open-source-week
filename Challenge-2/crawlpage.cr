require "http/client"

response = HTTP::Client.get("https://crystal-lang.org")
puts response.status_code
puts response.body.lines
