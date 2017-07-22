require 'yaml'
require 'time'
require 'optparse'

options = {}

OptionParser.new do |opts|
  opts.banner = 'Usage: app.rb [options] [file]'
  opts.separator "-----------------------"
  opts.separator ''
  opts.separator ''

  opts.on('-v', '--[no-]volume LEVEL', Integer,
          'Set the volume to LEVEL') do |v|
    if v == false
      options[:volume] = 0
    else
      options[:volume] = v
    end
  end

  opts.on('-s', '--[no-]speed VALUE', Integer,
          'Set the playback speed to VALUE', '  (min: 0, max: 100)') do |v|
    min = 0
    max = 100
    if v == false
      options[:speed] = 0
    elsif v < min
      options[:speed] = min
    elsif v > max
      options[:speed] = max
    else
      options[:speed] = v
    end
  end

  opts.on('-y', '--year YEAR', String, 'Timestamp for the track') do |v|
    options[:time] = Time.new(v)
  end

  opts.on('-c', '--colors a,b,c', Array,
          'Colors for the player') do |v|
    options[:colors] = v.map(&:strip).map(&:downcase)
  end

  track_types = [:long, :medium, :short]
  opts.on('-t', '--type TYPE', track_types,
          "Track type (#{track_types.join(', ')})") do |v|
    options[:type] = v
  end

  opts.separator ''
  opts.separator "--------------------------------------------------------\
-------------------"
  opts.separator ''

  opts.on_tail('-h', '--help', 'Show this help message') do
    puts opts
    exit
  end

  opts.on_tail('--version', 'Show the version') do
    puts '0.0.1'
    exit
  end
end.parse!

options[:file] = ARGV.shift
if !options[:file]
  puts 'ERROR: Need a file name'
  exit
end

options[:files] = ARGV.unshift

puts options.to_yaml
puts "\n\n----------------------------------------------------------------\
-----------\n\n"
puts ARGV.inspect
