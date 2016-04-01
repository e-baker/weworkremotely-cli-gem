require 'date'
require 'pry'

class Job
  attr_accessor :company, :position, :date_posted

  @@all = []

  def initialize(company, position, date_posted = nil)
    d = Date.today
    @company = company
    @position = position
    date_posted == nil ? @date_posted = "#{d.month}/#{d.day}/#{d.year}" : @date_posted = date_posted
    @@all << self
  end

  def self.all
    @@all
  end

end