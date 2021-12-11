def main
  stdin = $stdin.lazy.map { _1.scan(/\d+/).map &:to_i }

  called = stdin.first
  boards = []
  stdin.each do |row|
    if row.empty? 
      boards << Board.new unless boards.last&.empty?
      next
    end
    boards.fetch(-1) << row
  end

  scores = Enumerator.new do |y|
    called.each do |num|
      boards.delete_if do |board|
        if board.add_called num and score = board.win_score
          y << score
          next true
        end
        false
      end
    end
  end

  if s = scores.inject { |prev, score| score }  # Last
    puts s
  end
end

class Board < Array
  def initialize; super; @called = [] end
  def height = size
  def width = fetch(0).size
  private def fetch_at(pos) = fetch(pos.y).fetch(pos.x)

  def add_called(called_num)
    each_with_index do |row, y|
      row.each_with_index do |num, x|
        if num == called_num
          @called |= [Position.new(x,y)]
          return true
        end
      end
    end
    false
  end

  Position = Struct.new :x, :y

  def win_score
    counts_x = Hash.new 0
    counts_y = Hash.new 0
    win = @called.any? do |pos|
      (counts_x[pos.x] += 1) >= height \
        || (counts_y[pos.y] += 1) >= width
    end
    if win
      (sum { |row| row.sum } - @called.sum { |pos| fetch_at pos }) \
        * fetch_at(@called.fetch(-1))
    end
  end
end

main
