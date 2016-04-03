class WeWorkRemotelyController

  def initialize
    scraper = Scraper.new
    scraper.scrape
  end

  def call
    i = ""
    while i != "exit"
      puts "Please make your selection."
      puts "List: "
      puts "     (a)ll"
      puts "     (p)rogramming"
      puts "     (d)esign"
      puts "     de(v)ops/sysadmin"
      puts "     (m)arketing"
      puts "     (c)opywriting"
      puts "     customer (s)upport"
      puts "     (b)usiness/exec & management"
      puts "     all (o)ther jobs"
      puts "If you know the job id, enter it now for more specific information."
      i = gets.strip.downcase.chars.first
      case i
      when i.is_a?(Integer)
        find_by_id
      when "a"
        list_all
      when "p"
        list_by_category("programming")
      when "d"
        list_by_category("design")
      when "v"
        list_by_category("devops")
      when "m"
        list_by_category("marketing")
      when "c"
        list_by_category("copywriting")
      when "s"
        list_by_category("customer support")
      when "o"
        list_by_category("other")
      when "b"
        list_by_category("business")
      else
        puts "Please make a valid selection."
      end
    end
  end

end

# WeWorkRemotelyController.new.call