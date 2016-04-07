class WeWorkRemotely::Controller

  def initialize
    scraper = WeWorkRemotely::Scraper.new
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
      puts "To exit, type 'exit'."
      input = gets.strip
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
        number = gets.strip
        show_job(number)
      end
    end
  end

  def list_all
    WeWorkRemotely::Job.all.each do |j|
      puts "#{j.id}. #{j.name} for #{j.company.name}"
    end
  end

  def show_job(id)
    if j = WeWorkRemotely::Job.find_by_id(id)
      puts "===== Job Details ====="
      puts ""
      puts "Job ID:   #{j.id}"
      puts "Title:    #{j.name}"
      puts "Company:  #{j.company.name}"
      puts "Category: #{j.category.name.capitalize}"
      puts "Posted:   #{j.published_date}"
      puts "Job URL:  #{j.url}"
      puts "Job Description:"
      puts "#{j.description.squeeze("\n")}"
      puts ""
      puts "======================="
      puts ""
    else
      puts "======== ERROR ========"
      puts ""
      puts "Could not find a job with that ID."
      puts ""
      puts "======================="
    end
  end

  def list_by_category(category)
    puts ""
    c = WeWorkRemotely::Category.find_by_name(category)
    puts "There are <#{c.jobs.length}> #{category} jobs!"
    c.jobs.each do |job|
      puts "#{job.id}. #{job.name} for #{job.company.name}"
    end
    puts ""
  end

end