Gem::Specification.new do |s|
  s.name        = 'weworkremotely'
  s.version     = '1.1'
  s.date        = '2016-04-03'
  s.description = 'A catalog of recent remote job listings found on weworkremotely.com.'
  s.summary     = 'We Work Remotely'
  s.authors     = ['Eric Baker']
  s.email       = 'eric@ericbaker.me'
  s.files       = ['config/environment.rb','lib/weworkremotely.rb','lib/weworkremotely/category.rb','lib/weworkremotely/company.rb','lib/weworkremotely/controller.rb','lib/weworkremotely/job.rb','lib/weworkremotely/scraper.rb']
  s.homepage    = 'http://ericbaker.me/gems/weworkremotely-cli-gem'
  s.license     = 'MIT'
  s.executables << 'weworkremotely'
end