require 'faker'

data = []

def generate_row()
  [
   Faker::Name.name(),
   Faker::Number.number(2),
   ['male', 'female'].sample(),
   [1, 2, 3, 4].sample(),
   [1, 2].sample(),
   Faker::Number.number(5),
   Faker::Address.country(),
   Faker::Address.zip(),
   Faker::PhoneNumber.phone_number(),
   Faker::Name.title(),
  ]
end

10.times { data << generate_row() }

puts(%w{name age gender children cars income country zip phone title}
       .join("\t"))
data.each { |row| puts(row.join("\t")) }
