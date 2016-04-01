require 'open-uri'
require 'nokogiri'
require 'pry'
require_relative 'jobs'

class Scraper

  def scrape
    open_url = open("https://weworkremotely.com")
    doc = Nokogiri::HTML(open_url)
    @@results = []
    doc.css('li').each do |list_item|
      @@results << Job.new(list_item.css('.company').text, list_item.css('.title').text, list_item.css('.date').text)
    end
    @@results
  end

end

scraper = Scraper.new
binding.pry