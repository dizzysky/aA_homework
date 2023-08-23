class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {Array.new}
    place_stones
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, idx|
      if idx == 6 || idx == 13 
        next
      else
        4.times do 
          cup << :stone
        end
      end
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if start_pos < 0  || start_pos > 13
    raise 'Starting cup is empty'if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    current_cup = start_pos
    until stones.empty?
      current_cup += 1

      current_cup = 0 if current_cup > 13

      if current_cup == 6
        @cups[current_cup] << stones.pop if current_player_name == @name1
      elsif current_cup == 13
        @cups[current_cup] << stones.pop if current_player_name == @name2
      else
        @cups[current_cup] << stones.pop
      end
    end

    render
    next_turn(current_cup)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13 
      return :prompt
    elsif @cups[ending_cup_idx].count == 1
      return :switch
    else 
      return ending_cup_idx
    end
  end

  # def next_turn(ending_cup_idx)
  #   # helper method to determine what #make_move returns
  #   if ending_cup_idx == 6 || ending_cup_idx == 13
  #     # ended on store -- get to choose where to start again
  #     :prompt
  #   elsif @cups[ending_cup_idx].count == 1
  #     # ended on empty cup -- switches players' turns
  #     :switch
  #   else
  #     # ended on cup with stones in it -- automatically starts there
  #     ending_cup_idx
  #   end
  # end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?

    if @cups[0..5].all? {|cup| cup.empty?}
      return true
    end

    if @cups[7..12].all? {|cup| cup.empty?}
      return true
    end

    return false

  
  end

  def winner
    if @cups[6].length == @cups[13].length
      return :draw
    else
      @cups[6].length > @cups[13].length ? @name1 : @name2 
    end
  end
end