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
