class Team
  attr_accessor :points, :name, :average_age, :value
  @@all = []
  # [{:points => "12", :name => "Juventus",
  # :age => "28,2", :value => "$800mn"}]

  def initialize(hash_teams)
    hash_teams.each { |k,v| instance_variable_set("@#{k}", v) }
    @@all << self
  end

  def add_attributes(hash_attributes)
    hash_attributes.each { |k,v| instance_variable_set("@#{k}", v)}
  end

  def self.all
    @@all
  end

  def find_by_ranking()

  end
end
