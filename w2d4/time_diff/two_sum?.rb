def bad_two_sum?(list, target)
  list.count.times do |i|
    ((i + 1)..list.length - 1).each do |j|
      return true if list[i] + list[j] == target
    end
  end
  false
end

def ok_two_sum?(list, target)
  list.sort!
  list.each_with_index do |el, idx|
    result = list.bsearch{|x| x == target - el unless idx == list.index(x)}
    return true unless result.nil?
  end

  false
end

def big_guns(list, target)
  h = Hash.new{ |k, v| h[k] = v }
  list.each do |el|
    h[el] = target 
  end
  
  list.each do |el|
    unless target - el == el
      return true if h.key?(target - el)
    end
  end
  false
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

# arr = [0, 1, 5, 7]
# p ok_two_sum?(arr, 6) # => should be true
# p ok_two_sum?(arr, 10) # => should be false


arr = [0, 1, 5, 7]
p big_guns(arr, 6) # => should be true
p big_guns(arr, 10) # => should be false
