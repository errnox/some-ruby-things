class Observer
  def initialize(observable)
    observable.observers << self
  end

  def update(*args)
    puts "#{self} - Got #{args}"
  end
end
