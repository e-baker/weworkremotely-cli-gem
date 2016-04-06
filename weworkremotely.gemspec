Gem::Specification.new do |s|
  s.name        = 'weworkremotely'
  s.version     = '1.3'
  s.date        = '2016-04-03'
  s.description = 'A catalog of recent remote job listings found on weworkremotely.com.'
  s.summary     = 'We Work Remotely'
  s.author      = 'Eric Baker'
  s.email       = 'eric@ericbaker.me'
  s.files       = ['config/environment.rb','lib/weworkremotely.rb','lib/weworkremotely/category.rb','lib/weworkremotely/company.rb','lib/weworkremotely/controller.rb','lib/weworkremotely/job.rb','lib/weworkremotely/scraper.rb']
  s.homepage    = 'http://ericbaker.me/gems/weworkremotely-cli-gem'
  s.license     = 'MIT'
  s.executables << 'weworkremotely'

  s.add_runtime_dependency "bundler", "~> 1.11"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_runtime_dependency "nokogiri", "~> 1.6.7"
  s.add_development_dependency "pry"
  s.add_runtime_dependency "require_all"
  #s.add_development_dependency "open-uri"
  s.add_runtime_dependency "rails-html-sanitizer", "~> 1.0"
end
