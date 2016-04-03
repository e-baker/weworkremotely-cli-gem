class Company
  attr_accessor :name, :jobs

  @@all = []

  def initialize(name)
    @name = name
    @jobs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    company = Company.new(name)
    company.save
    company
  end

  def add_job(job)
    self.jobs << job unless self.jobs.include?(job)
    job.company = self unless job.company == self
  end

  def categories
    self.jobs.collect { |job| job.category }.uniq
  end

  def self.find_or_create_by_name(name)
    self.all.detect { |company| company.name == name } || self.create(name)
  end

end