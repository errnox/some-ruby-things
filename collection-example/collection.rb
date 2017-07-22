class TestCollection
  include Enumerable
  attr_reader :items

  def initialize
    @items = [11, 22, 33, 44, 55, 66, 77]
    @pointer = 0
  end

  def next
    item = @items[@pointer]
    if @items.length < 100
      @items << @items[@pointer]
    end
    @pointer = @pointer + 1
    item
  end
end

test_collection = TestCollection.new
# test_collection.items.length.times do
#   puts test_collection.next
# end

i = 0
while i < test_collection.items.length
  i = i + 1
  puts test_collection.next
end
