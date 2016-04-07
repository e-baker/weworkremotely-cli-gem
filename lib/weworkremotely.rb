require 'open-uri'
require 'nokogiri'
require 'rails-html-sanitizer'
require 'require_all'

module WeWorkRemotely
end

require_relative "./weworkremotely/category"
require_relative "./weworkremotely/company"
require_relative "./weworkremotely/controller"
require_relative "./weworkremotely/job"
require_relative "./weworkremotely/scraper"