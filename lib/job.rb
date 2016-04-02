require 'date'
require 'pry'

class Job
  attr_accessor :id, :company, :position, :description, :published_date, :url

  @@all = []

  def initialize(id: nil, company: nil, position: nil, description: nil, published_date: nil, url: nil)
    @company = company
    @position = position
    @description = description
    @published_date = published_date
    @url = url
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find_by_id(id)
    self.all.detect { |job| job.id == id }
  end

end