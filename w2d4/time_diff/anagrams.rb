# this is O(n!)
def first_anagram?(str_1, str_2)
  words = str_1.chars.permutation.to_a

  anagrams = []
  words.each do |word|
    anagrams << word.join("")
  end
  anagrams.include?(str_2)
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true


# I think this is n^3??
def second_anagram?(str_1, str_2)
  return false unless str_2.length == str_1.length
  str_1.chars.each do |letter|
    idx = str_2.chars.find_index(letter)
    unless idx.nil?
      str_2.delete!(str_2[idx])
    end
  end

  str_2.empty?
end

p second_anagram?("abc", "bac")

def third_anagram?(string)

end

def fourth_anagram?(string)

end