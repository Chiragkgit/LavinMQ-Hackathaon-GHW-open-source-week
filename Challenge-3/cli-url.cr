
# CLI to crawl a URL and print the status code and print the html lines
url = ARGV[0]? || "https://crystal-lang.org"
puts "Using default url: #{url}"
# or
url = ARGV[0]?
if url.nil?
  # exit and print usage notice if url argument is missing
  abort "No URL provided"
end
