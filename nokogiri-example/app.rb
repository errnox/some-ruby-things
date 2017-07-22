require 'open-uri'
require 'nokogiri'


class Scraper

  def initialize
    @output_dir = 'output'
  end

  def scrape_website(uri)
    _scrape open(uri)
  end

  def scrape_websites(websites)
    urls = []
    websites.each do |website|
      scrape_website(website).each { |url| urls << url }
    end
    Dir.mkdir(@output_dir) unless Dir.exists?(@output_dir)
    File.open("#{@output_dir}/websites", 'w+') { |f| f.puts urls }
  end

  def scrape_file(path)
    _scrape File.read(path)
  end

  private

  def _scrape(text)
    document = Nokogiri::HTML::Document.parse(text) do |config|
      config.nonet
    end

    links = document.css('a')
    link_texts = []
    links.map do |link|
      if (link['href'] =~ /.*http.*/ && link.text != nil)
        link_texts << link['href']
      end
    end
    link_texts
  end

end

scraper = Scraper.new
websites = %w{
http://digg.com/
http://reddit.com/
}
scraper.scrape_websites(websites)
