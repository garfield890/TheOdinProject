def collatz(num)
  if num == 1
    0
  elsif num.even?
    1 + collatz(num / 2)
  else
    1 + collatz((3 * num) + 1)
  end
end

puts collatz(27)
