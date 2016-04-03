class WeWorkRemotelyController

  def initialize
    scraper = Scraper.new
    scraper.scrape
  end

  def call
    input = ""
    while input != "exit"
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
      puts "You can also look by job (n)umber."
      input = STDIN.gets.strip
      case input
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
      when "n"
        puts "Which job number would you like to see?"
        number = gets
        Job.find_by_id(number)
      end
    end
  end

end