def substrCalc(words, dictionary)
  arr = words.downcase.split
  resultHash = Hash.new(0)
  arr.each do |word|
    dictionary.each do |sample|
      if (word.include?(sample))
        resultHash[sample]+=1
      end
    end
  end
  return resultHash
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrCalc("below", dictionary)
puts substrCalc("Howdy partner, sit down! How's it going?", dictionary)