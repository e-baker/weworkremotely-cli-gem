class WeWorkRemotely::Job
  attr_accessor :id, :company, :name, :description, :published_date, :url, :category

  @@all = []

  def initialize(id: nil, company: nil, name: nil, description: nil, published_date: nil, url: nil, category: nil)
    @id = id if id
    @name = name
    @published_date = published_date if published_date
    @url = url if url
    @description = description if description
    @company = WeWorkRemotely::Company.find_or_create_by_name(company) if company
    @company.add_job(self)
    @category = WeWorkRemotely::Category.find_or_create_by_name(category) if category
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