require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def scrape
    open_url = open("https://weworkremotely.com")
    doc = Nokogiri::HTML(open_url)
    results = {}
    doc.css('li').each do |list_item|
      Jobs.new(company: list_item.css('.company'), position: list_item.css('.title').text, date_posted: list_item.css('.date').text)
    end
    results
  end

end