module GTD
  class Task
    attr_reader :name, :relevance

    def initialize(name, **options)
      options = {:description => nil, :actionable => true,
        :concerns => nil, :immediate => false, :complex => false,
        :relevant => true, :relevance => nil}
        .merge(options)

      @name = name

      @description = options[:description]
      @actionable = options[:actionable]
      @concerns = options[:concerns]
      @immediate = options[:immediate]
      @complex = options[:complex]
      @relevant = options[:relevant]
      @relevance = options[:relevance]

      puts(name)
      puts(options)
    end

    def actionable?()
      @actionable ? true : false
    end

    def concerns?(person)
      @concerns == person ? true : false
    end

    def immediate?()
      @immediate ? true : false
    end

    def complex?()
      @complex ? true : false
    end

    def relevant?()
      @relevant ? true : false
    end
  end

  class Engine
    def initialize(**options)
      options = {:name => 'John'}.merge(options)

      @user = options[:user]

      @trash = []

      @now = []
      @delegated = []
      @actions = []
      @calendar = []
      @projects = []

      @someday = []
      @ticklers = []
      @reference = []
    end

    def ingest(task)
      if task.actionable?
        if task.concerns?(@user)
          if task.immediate?
            @now << task
          else
            if task.complex?
              @projects << task
            else
              @actions << task
            end
          end
        else
          @delegated << task
        end
      else
        if task.relevant?
          if task.relevance == :tickler
            @ticklers << task
          elsif task.relevance == :someday
            @someday << task
          elsif task.relevance == :reference
            @reference << task
          end
        else
          @trash << task
        end
      end
    end

    def report()
      report = ""
      report << "------------------------------\n"
      report << "Now\n\n"
      @now.each { |task| report << "  #{task.name}\n" }
      report << "\n------------------------------\n"
      report << "Delegated\n\n"
      @delegated.each { |task| report << "  #{task.name}\n" }
      report << "\n------------------------------\n"
      report << "Actions\n\n"
      @actions.each { |task| report << "  #{task.name}\n" }
      report << "\n------------------------------\n"
      report << "Calendar\n\n"
      @calendar.each { |task| report << "  #{task.name}\n" }
      report << "\n------------------------------\n"
      report << "Projects\n\n"
      @projects.each { |task| report << "  #{task.name}\n" }

      report << "\n\n------------------------------\n"
      report << "Someday\n\n"
      @someday.each { |task| report << "  #{task.name}\n" }
      report << "\n------------------------------\n"
      report << "Ticklers\n\n"
      @ticklers.each { |task| report << "  #{task.name}\n" }
      report << "\n------------------------------\n"
      report << "Reference\n\n"
      @ticklers.each { |task| report << "  #{task.name}\n" }

      report << "\n\n------------------------------\n"
      report << "\nTrash\n\n"
      @trash.each { |task| report << "  #{task.name}\n" }

      report
    end
  end
end


if __FILE__ == $0
  user = 'John'
  tasks =
    [
     GTD::Task.new('Do nothing', :concerns => user, :ationable => false),
     GTD::Task.new('Go diving', :concerns => user, :actionable => false, :relevance => :tickler),
     GTD::Task.new('Make trouble', :concerns => user, :actionable => false),
     GTD::Task.new('Call John', :concerns => user, :immediate => true),
     GTD::Task.new('Call Abbey', :concerns => user, :complex => true),
     GTD::Task.new('Build rack'),
     GTD::Task.new('Buy groceries', :concerns => user),
     GTD::Task.new('Buy bike', :concerns => 'Anne'),
    ]

  engine = GTD::Engine.new(:user => user)
  tasks.each { |task| engine.ingest(task) }
  puts(engine.report())
end
