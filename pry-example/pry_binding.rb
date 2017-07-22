require 'pry'

# A simple entity.
class Entity
  attr_accessor :alive
  attr_reader :name
  attr_reader :age

  # Initializes an entity.
  #
  # @param name [String] the name of the entitty
  # @param age [Number, String] the age of the entitty
  #
  # @return [nil] nothing
  def initialize(name, age)
    @name = name
    @age = age
  end

  # Generates a report for the entity.
  #
  # @return [String] a short report of the entity
  def report
    <<-STRINGSTRINGSTRING
Name: #{@name}
Age: #{@age}
Alive: #{@alive}
STRINGSTRINGSTRING
  end
end

pete = Entity.new 'Pete', 34
pete.alive = true

cabbage = Entity.new 'Cabbage', '4 days'
cabbage.alive = false

binding.pry

puts 'Done.'
