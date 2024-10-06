require "http/client"
require "html_parser"

# This class performs the crawling and link extraction
class WebCrawler
  def initialize(url : String)
    @url = url
  end

  def crawl
    # Perform an HTTP GET request to fetch the page
    response = HTTP::Client.get(@url)

    # Check if the response is successful
    if response.status_code == 200
      # Parse the response body to find links
      extract_links(response.body)
    else
      puts "Failed to fetch the page. Status code: #{response.status_code}"
    end
  rescue e : Exception
    puts "An error occurred: #{e.message}"
  end

  private def extract_links(body : String)
    # Parse the HTML document
    parser = HTML::Parser.new(body)

    # Traverse all elements looking for "a" tags with href attributes
    parser.on_tag("a") do |element|
      href = element.attributes["href"]
      if href && (href.starts_with?("http://") || href.starts_with?("https://"))
        puts "Found link: #{href}"
      end
    end

    # Parse the entire body
    parser.parse
  end
end

# Check if a URL is passed as a command-line argument
url = ARGV[0]? || "https://example.com"

# Create an instance of the WebCrawler and crawl the provided URL
crawler = WebCrawler.new(url)
crawler.crawl
