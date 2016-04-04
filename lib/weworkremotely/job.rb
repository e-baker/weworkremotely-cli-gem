class Job
  attr_accessor :id, :company, :name, :description, :published_date, :url, :category

  @@all = []

  def initialize(id: nil, company: nil, name: nil, published_date: nil, url: nil, category: nil)
    @id = id
    @name = name
    @published_date = published_date
    @url = url
    @company = Company.find_or_create_by_name(company) if company
    @company.add_job(self)
    @category = Category.find_or_create_by_name(category) if category
    @category.add_job(self)
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_id(id)
    self.all.detect { |job| job.id == id }
  end

  def self.destroy_all
    @@all.clear
  end

end