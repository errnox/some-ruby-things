require 'open-uri'
require 'nokogiri'

class Scraper
  def initialize()
    @url = 'http://blog.newrelic.com/page/'
    @output_dir = 'data'
    @links = []
    @user_agent = "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:25.0) \
Gecko/20100101 Firefox/25.0"
    @proxy = ''
  end

  public

  def scrape()
    1.upto(20) do |i|
      scrape_site(open("#{@url}#{i}", 'User-Agent' => @user_agent,
                       'proxy' => @proxy).read())
      sleep(2)
    end
    write_output_file()
  end

  private

  def scrape_site(url)
    document = Nokogiri::HTML::Document.parse(url) do |config|
      config.nonet()
    end
    links = document.css('h1.entry-title > a')
    links.each { |link| @links << [link['href'], link.text] }
  end

  def write_output_file()
    s = ''
    @links.each { |l| s << "<li><a href=\"#{l[0]}\">#{l[1]}</a></li>" }
    html = "<!DOCTYPE HTML>\
<html>\
  <head>\
    <title>Links</title>\
  </head>\
\
  <body>\
    <ul>
#{s}\
    </ul>
  </body>\
</html>\
"
    Dir.mkdir(@output_dir) unless Dir.exists?(@output_dir)
    File.open("#{@output_dir}/links.html", 'w+') { |f| f.puts(html) }
  end
end

scraper = Scraper.new()
scraper.scrape()
