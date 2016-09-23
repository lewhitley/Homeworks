class LRUCache
  def initialize(size)
    @size = size
    @store = Array.new
  end

  def count
    # returns number of elements currently in cache
    @store.length
  end

  def add(el)
    # adds element to end (most recent) according to LRU principle
    if @store.include?(el)
      @store.delete(el)
    elsif count == @size
      @store.shift
    end
    @store << el
  end

  def show
    # shows the items in the cache, with the LRU item first
    p @store
    nil
  end
end
#time complexity == n
#can improve this with a node class that makes a linked array and then using a hash

johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

p johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})


johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
