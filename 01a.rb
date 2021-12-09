prev = nil
increases = 0
$stdin.each do |num|
  num =~ /\d+/ or next
  num = $&.to_i
  increases += 1 if prev && num > prev
  prev = num
end
puts increases
