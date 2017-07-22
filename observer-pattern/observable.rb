class Observable
  attr_accessor :observers

  def initialize
    @observers = []
  end

  def notify(*args)
    @observers.each { |observer| observer.update *args }
  end
end
