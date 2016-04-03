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

  def companies
    self.jobs.collect { |j| j.company }.uniq
  end

end