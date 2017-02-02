class Towers
  attr_accessor :grid

  def initialize(grid = nil)
    @grid = grid || [[3, 2, 1], [], []]
  end

  def play
    render
    until won?
      puts "Please select moving position: tower to move from, tower to move to"
      puts "i.e. inputting '0, 2' will move disk from tower 0 to tower 2"
      print ">"

      input = parse(gets.chomp)
      move(input)
      system("clear")
      render
    end
    puts "You win!"
  end

  def move(position)
    start_tower = position[0]
    end_tower = position[1]

    if @grid[end_tower].last.nil?
      @grid[end_tower] << @grid[start_tower].pop
    elsif @grid[start_tower].last > @grid[end_tower].last
      raise "Cannot place larger disk atop smaller"
    else
      @grid[end_tower] << @grid[start_tower].pop
    end
  end

  def [](x, y)
    @grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end

  def won?
    @grid[0].empty? && (@grid[1].length == 3 || @grid[2].length == 3)
  end

  def parse(input)
    new_input = input.split(",")
    array = []

    new_input.each do |el|
      array << el.to_i
    end

    array
  end

  def render
    p @grid
  end

end

if __FILE__ == $PROGRAM_NAME

  test = Towers.new
  test.play


  #test.move([0,0])
end
