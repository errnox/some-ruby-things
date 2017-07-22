# Example:
#
# Videos total: 1752
# Requests needed: 36

start_index = 1
num_requests = 36

num_requests.times do |i|
  system `curl "https://gdata.youtube.com/feeds/api/users/USERNAME/uploads?max-results=50&start-index=#{start_index}&prettyprint=true&fields=entry(title,media:group(media:player(@url)))" >> titles#{i}.xml; sleep 0.5`
  start_index += 50
  puts "Fetching with index: #{start_index}"
end
