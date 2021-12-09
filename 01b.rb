WINDOW_SIZE = 3
increases = 0
windows = []
last = nil
$stdin.each do |strength|
  strength =~ /\d+/ or next
  strength = $&.to_i
  windows.unshift []
  windows.each { _1 << strength }
  if windows.last&.size == WINDOW_SIZE
    prev, last = last, windows.pop
  end
  if last && prev && last.sum > prev.sum
    increases += 1
  end
end
puts increases
