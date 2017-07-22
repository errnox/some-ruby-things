require 'thor'



module Airplane
  module CLI
    class Selftest < Thor
      desc 'fast [--quick] [NAME]', 'Perform a selftest for airplane with \
name NAME'
      option :alias => :f, :type => :string
      option :quick, :type => :string
      def fast(*name)
        action = options[:quick] ? "Quickstarting" : "Starting"
        name = name[0] || '<default>'
        puts "#{action} airplane \"#{name}\""
      end

      desc 'slow [NAME]', 'Perform an extensible selftest for airplane \
with name NAME'
      option :alias => :s, :type => :string
      def fast(*name)
        name = name[0] || '<default>'
        puts "Starting airplane \"#{name}\""
      end
    end

    class Flight < Thor
      desc 'start SUBCOMMAND OPTIONS', 'Start an airplaine'
      subcommand 'start', Airplane::CLI::Selftest
    end

  end
end

Airplane::CLI::Flight.start(ARGV)

# if ARGV[0] == 'start'
#   if ARGV[1] == 'fast'
#     puts 'Starting fast'
#   elsif ARGV[1] == 'slow'
#     puts 'Starting slow'
#   else
#     puts 'Starting'
#   end
# else
#   puts 'Help'
# end
