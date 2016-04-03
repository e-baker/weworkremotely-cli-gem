class WeWorkRemotelyController

  def initialize
    scraper = Scraper.new
    scraper.scrape
  end

  def call
    i = ""
    while i != "exit"
      puts "Please make your selection."

    end
  end

end