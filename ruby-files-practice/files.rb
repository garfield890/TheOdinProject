# $stdout.puts "Hello world"
# $stdin.gets

# io = IO.new(1)
# io.puts "Hello world!"

# num1 = IO.sysopen 'input.txt'
# read = IO.new(num1)
# num2 = IO.sysopen 'output.txt', 'w'
# write = IO.new(num2)

# puts read.gets
# puts read.eof?
# read.rewind
# puts read.gets

# write.puts "Hello world"
# write.puts 'goodbye world'

File.open("input.txt", "r") do |file|
  for line in file.readlines()
    puts line
  end
end

File.open("output.txt", "r+") do |file|
  file.readline()
  file.write("\nYou are a bold one...")
end