# # This is O(n^2)
# def my_min(list)

#   list.each do |i|
#     return i if list.all?{ |el| i <= el }
#   end
# end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5


# # This is a O(n)
# def my_min(list)
#   min = list.first
#   list.each do |el|
#     min = el if el < min 
#   end
#   min
# end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

# # Overall this method is O(n^3)
# def largest_contiguous_subsum(list)
# subs = []
  
# # this piece is O(n^3)
#   list.count.times do |i|
#     (i..list.length - 1).each do |j|
#       subs << list[i..j]
#     end
#   end
  
#   largest = subs[0][0]
# # this piece is O(n^2)
#   subs.each do |sub|
#     sum = sub.inject(:+)
#     largest = sum if sum > largest
#   end
  
#   largest
# end

# This is O(n) because it only has list.size number of operations
def largest_contiguous_subsum(list)
  # This is O(1) space complexity because we only store these 
  # one time in memory, and then reuse these memory locations
  # over and over, so the amont of memory required doesn't grow
  largest = list.first
  local_sum = list.first

  return list.max if list.all? { |el| el < 0 }

  (1...list.count).each do |i|
    local_sum = 0 if local_sum < 0
    local_sum += list[i]
    largest = local_sum if local_sum > largest
  end
  largest
end

list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])