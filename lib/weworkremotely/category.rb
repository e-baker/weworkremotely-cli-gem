class Category
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
    category = Category.new(name)
    category.save
    category
  end

  def add_job(job)
    self.jobs << job unless self.jobs.include?(job)
    job.category = self unless job.category == self
  end

  def companies
    self.jobs.collect { |j| j.company }.uniq
  end

  def self.find_or_create_by_name(name)
    self.all.detect { |category| category.name == name } || self.create(name)
  end

  def self.find_by_name(name)
    self.all.detect { |cat| cat.name == name }
  end

end