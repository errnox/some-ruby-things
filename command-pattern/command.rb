class Command
  attr_accessor :description

  def initialize(description, execute_function, unexecute_function)
    @description = description
    @execute_function = execute_function
    @unexecute_function = unexecute_function
  end

  def execute
    @execute_function.call
  end

  def unexecute
    @unexecute_function.call
  end
end
