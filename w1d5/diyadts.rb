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
