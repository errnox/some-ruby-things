require_relative 'observable'
require_relative 'observer'

observable = Observable.new
observer1 = Observer.new observable
observer2 = Observer.new observable
observer3 = Observer.new observable

observable.notify 'Test event'
observable.notify 'Another test event', nil
