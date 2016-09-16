class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    p @stack
  end
end

# stack = Stack.new
# stack.show
# stack.add(2)
# stack.add(4)
# stack.show
# stack.add(3)
# stack.show
# stack.remove
# stack.remove
# stack.show

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
  end

  def dequeue
    @queue.shift
  end

  def show
    p @queue
  end
end

# queue = Queue.new
# queue.show
# queue.enqueue(1)
# queue.show
# queue.enqueue(2)
# queue.show
# queue.dequeue
# queue.show
# queue.enqueue(3)
# queue.show

class MyMap
  def initialize
    @map = []
  end

  def assign(key,value)
    if !key_exists?(key)
      @map << [key,value]
    else
      reassign(key,value)
    end
  end

  def lookup(key)
    if key_exists?(key)
      p value(key)
    else
      puts "That key does not exist"
    end
  end

  def remove(key)
    if key_exists?(key)
      @map.delete_at(key_index(key))
    else
      p "That key does not exist"
    end
    nil
  end

  def show
    p @map
  end

  private

  def reassign(key,value)
    @map[key_index(key)] = [key,value]
  end

  def keys
    keys = []
    return [] if @map == []
    @map.each {|pair| keys << pair[0]}
    keys
  end

  def value(key)
    @map[key_index(key)][1]
  end

  def key_exists?(key)
    return true if keys.include?(key)
    false
  end

  def key_index(key)
    keys.each_with_index do |check_key, i|
      return i if check_key == key
    end
  end
end

map = MyMap.new
map.assign(2,true)
map.show
map.assign(2,false)
map.assign(3,true)
map.show
map.remove(2)
map.lookup(2)
map.lookup(3)
