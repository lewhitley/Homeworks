class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14){[]}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.map!.with_index do |cup, i|
      unless i==6 || i==13
        cup += [:stone, :stone, :stone, :stone]
      else
        cup = []
      end
    end
  end

  def valid_move?(start_pos)
    start_pos -= 1
    if !(start_pos.between?(0,5) || start_pos.between?(7,12))
      raise "Invalid starting cup"
    elsif @cups[start_pos].empty?
      raise "Invalid starting cup"
    else
      true
    end
  end

  def make_move(start_pos, current_player_name)
    if current_player_name == @name1
      other = 13
    else
      other = 6
    end
    stones = @cups[start_pos]
    @cups[start_pos] = []
    i = start_pos
    until stones.empty?
      if i == 13
        i = 0
      else
        i+=1
      end
      unless i == other
        @cups[i] << stones.pop
      end
    end
    render
    next_turn(i)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return :switch if @cups[ending_cup_idx].length == 1
    ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def cups_empty?
    non_point_cups1 = (0..5).to_a
    non_point_cups2 = (7...13).to_a
    return true if non_point_cups1.all? {|i| @cups[i].empty?} || non_point_cups2.all? {|i| @cups[i].empty?}
    false
  end

  def winner
    if @cups[6].length > @cups[13].length
      @name1
    elsif @cups[6].length < @cups[13].length
      @name2
    else
      :draw
    end
  end
end
