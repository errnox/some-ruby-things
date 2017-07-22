class Logger
  # private_class_method :new

  @@instance = nil
  def self.instance
    if @@instance.nil?
      @@instance = self.new
    end
    @@instance
  end

  def log(message)
    puts "#{self}: #{message}"
  end
end

logger = Logger.instance
logger.log 'Logger working'

logger2 = Logger.instance
logger2.log 'Logger 2 working'
