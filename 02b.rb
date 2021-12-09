pos = aim = depth = 0
$stdin.each do |line|
  line =~ /^(\w+) (\d+)$/ or next
  action, num = $1, $2.to_i
  case action
  when 'forward' then pos += num; depth += num * aim
  when 'up' then aim -= num
  when 'down' then aim += num
  else next
  end
end
puts pos * depth
