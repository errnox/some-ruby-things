require 'net/http'

get_url = 'http://httpbin.org/get'
post_url = 'http://httpbin.org/post'

puts Net::HTTP.get_response(URI.parse(get_url)).body
post_data = {
  :first_name => 'John',
  :last_name => 'Doe',
  :age => '34',
  :city => 'New York',
}
puts Net::HTTP.post_form(URI.parse(post_url), post_data).body
