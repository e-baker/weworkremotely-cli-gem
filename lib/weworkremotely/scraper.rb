class Scraper

  def scrape
    #open_url = open("https://weworkremotely.com")
    scrape_category("programming")
    scrape_category("design")
    scrape_category("devops")
    scrape_category("marketing")
    scrape_category("copywriting")
    scrape_category("customer support")
    scrape_category("business")
    scrape_category("other")
  end

  def scrape_category(category)
    case category
    when "programming"
      open_url = open("https://weworkremotely.com/categories/2-programming/jobs.rss")
    when "design"
      open_url = open("https://weworkremotely.com/categories/1-design/jobs.rss")
    when "devops"
      open_url = open("https://weworkremotely.com/categories/6-devops-sysadmin/jobs.rss")
    when "marketing"
      open_url = open("https://weworkremotely.com/categories/9-marketing/jobs.rss")
    when "copywriting"
      open_url = open("https://weworkremotely.com/categories/5-copywriting/jobs.rss")
    when "customer support"
      open_url = open("https://weworkremotely.com/categories/7-customer-support/jobs.rss")
    when "business"
      open_url = open("https://weworkremotely.com/categories/3-business-exec-management/jobs.rss")
    when "other"
      open_url = open("https://weworkremotely.com/categories/4-remote/jobs.rss")
    end
    doc = Nokogiri::XML(open_url)
    @@results = []
    doc.xpath("//item").each do |list_item|
      title = list_item.css('title').text.split(": ")
      catgeory = Category.find_or_create_by_name(category)
      id = list_item.css('guid').text.split("/").last.split("-").first
      # description: list_item.css('description').text, => Caused problems. Would like to figure out how to include.
      @@results << Job.new(id: id, company: title[0], name: title[1], published_date: list_item.css('pubDate').text, url: list_item.css('guid').text, category: category)
    end
  end

end