require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def scrape
    #open_url = open("https://weworkremotely.com")
    scrape_category("programming")
  end

  def scrape_category(category)
    case category
    when "programming"
      open_url = open("https://weworkremotely.com/categories/2-programming/jobs.rss")
    end
    doc = Nokogiri::XML(open_url)
    @@results = []
    doc.xpath("//item").each do |list_item|
      title = list_item.css('title').text.split(": ")
      catgeory = Category.find_or_create_by_name(category)
      id = list_item.css('guid').text.split("/").last.split("-").first
      @@results << Job.new(id: id, company: title[0], name: title[1], description: list_item.css('description').text, published_date: list_item.css('pubDate').text, url: list_item.css('guid').text, category: category)
    end
  end

end