require 'open-uri'
require 'nokogiri'
require 'pry'
require_relative 'job'

class Scraper

  def scrape
    #open_url = open("https://weworkremotely.com")
    open_url = open("https://weworkremotely.com/categories/2-programming/jobs.rss")
    doc = Nokogiri::XML(open_url)
    @@results = []
    doc.xpath("//item").each do |list_item|
      title = list_item.css('title').text.split(":")
      id = list_item.css('guid').text.split("/").last.split("-").first
      @@results << Job.new(id: id, company: title[0], position: title[1], description: list_item.css('description').text, published_date: list_item.css('pubDate').text, url: list_item.css('guid').text)
    end
    @@results
  end

end