require 'faker';

class DataGenerator
  def random_array()
    50.times.collect { [*70..100].sample}
  end

  def generate()
    s = "[\n"
    200.times do |i|
      id = i
      name = Faker::Lorem.sentence
      description = Faker::Lorem.paragraph
      user = [*0..100].sample
      data = random_array
      s << <<-TODO
  {
    "id": #{id},
    "user": #{user},
    "name": "#{name}",
    "description": "#{description}",
    "datapoints": #{data}
  },
TODO
    end
    s << "]"
    puts(s)
  end
end

data_generator = DataGenerator.new()
data_generator.generate()
