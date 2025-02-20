def caesarCipher(str, vals)
  char_vals = []
  str.each_char do |character|
    if character == ' '
      char_vals.push(1000)
      next
    end
    char_vals.push(((character.ord - 'a'.ord + vals) % 26) + 'a'.ord)
  end
  newStr = ''
  char_vals.each do |val|
    if val == 1000
      newStr += ' '
      next
    end
    newStr += val.chr
  end
  newStr
end

puts caesarCipher('what a string', 5)
