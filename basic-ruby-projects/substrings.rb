# frozen_string_literal: true

def substrCalc(words, dictionary)
  arr = words.downcase.split
  resultHash = Hash.new(0)
  arr.each do |word|
    dictionary.each do |sample|
      resultHash[sample] += 1 if word.include?(sample)
    end
  end
  resultHash
end

dictionary = %w[below down go going horn how howdy it i low own part partner sit]
puts substrCalc('below', dictionary)
puts substrCalc("Howdy partner, sit down! How's it going?", dictionary)
