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
f = File.open("input.txt")
while line = f.gets do
  puts line
end
f.close

File.open("output1.txt", "r+") do |file|
  file.readline()
  file.write("\nYou are a bold one...")
  puts File.exist? "input.txt"
  puts File.mtime "output1.txt"
  puts file.size
  # File.rename "output.txt", "output1.txt"
end

Dir.mkdir "tmp"
puts Dir.exist? "tmp"
puts Dir.pwd
sleep(5)
Dir.rmdir "tmp"
Dir.mkdir "tmp"
fls = Dir.entries '.'
puts fls.inspect