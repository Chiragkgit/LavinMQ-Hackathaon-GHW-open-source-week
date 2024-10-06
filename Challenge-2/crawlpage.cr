require "http/client"


# Crawl a page and print the status code and print the html lines
response = HTTP::Client.get("https://crystal-lang.org")
puts response.status_code
puts response.body.lines
