require 'optparse'
require 'securerandom'


module CLI
  @@options = {}

  def self.options
    @@options
  end

  OptionParser.new do |opts|
    opts.on('-s', '--speed SPEED', Integer, 'Speed of the thing') do |v|
      @@options[:speed] = v
    end

    opts.on('-i', '--intensity INTENSITY', Integer,
            'Intensity of the thing') do |v|
      @@options[:intensity] = v
    end

    opts.on('-v', '--volume VOLUME', Integer, 'Volume of the thing') do |v|
      @@options[:volume] = v
    end
  end.parse!
end

class Subscription
  def initialize
    @id = SecureRandom.uuid
  end

  def message(activity)
    <<-DESCRIPTION
#{activity} subscription
  with ID #{@id}
  with speed #{CLI.options[:speed]}
  at volume #{CLI.options[:volume]}
  and intensity #{CLI.options[:intensity]}
    DESCRIPTION
  end

  def create
    message('Creating')
  end

  def update
    message('Updating')
  end

  def delete
    message('Deleting')
  end


  def info
    "This is some info about a subscription with this ID:\n  #{@id}"
  end
end

class User
  def initialize
    @id = SecureRandom.uuid
  end

  def message(activity)
    <<-DESCRIPTION
#{activity} user
  with ID #{@id}
  with speed #{CLI.options[:speed]}
  at volume #{CLI.options[:volume]}
  and intensity #{CLI.options[:intensity]}
    DESCRIPTION
  end

  def create
    message('Creating')
  end

  def update
    message('Updating')
  end

  def delete
    message('Deleting')
  end

  def info
    "This is some info about a user with this ID:\n  #{@id}"
  end
end

commands = {
  'sub' => lambda() { Subscription.new },
  'user' => lambda() { User.new },
}

actions = {
  'new' => :create,
  'change' => :update,
  'remove' => :delete,
}

# Let's inspect it
#
# require 'awesome_print'
# ap CLI.options

if ARGV[0]
  if ARGV[1]
    puts commands[ARGV[0]].call().send(actions[ARGV[1]])
  else
    puts commands[ARGV[0]].call().info
  end
end
