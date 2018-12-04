require 'byebug'


#Iterative
def range(start, end_num)
  result = []
  i = start
  while i < end_num
    result << i
    i += 1
  end
  
  result
end

# recursive
def range(start, end_num)
  return [] if start >= end_num
  [start].concat(range(start + 1, end_num))
end

# # p range(3, 8)
# #Iterative
# def sum_array(array)
#   array.inject(0) { |sum, el| sum+el }
# end

# Recursive
def sum_array(array)
  return 0 if array.empty?
  array[0] + sum_array(array[1..-1])
end

# p sum_array([1,2,3])

# recursive 1.0

# def exponent(base, exp)
#   return 1 if exp == 0
#       p "This is stack frame"
#   base * exponent(base, exp - 1)
# end

# # recursive 2.0
def exponent(base, exp)
  return 1 if exp == 0
  return base if exp == 1
  
  # counter = 0
  # p counter.object_id
  if exp % 2 == 0
    half_power = exp / 2
    half_result = exponent(base, half_power)
  
    # p "This is stack frame number #{counter += 1}"
    # p counter.object_id
    return half_result * half_result
  else exp % 2 != 0
    make_even = exp - 1
    half_power = make_even / 2
    half_result = exponent(base, half_power)
    return base * half_result * half_result
  end
end

# p exponent(2, 4)
# p exponent(2, 256)

def deep_dup(array)
  return [] if array.empty?
  result = []
  # array + deep_dup(array[1..-1])
  array.length.times do |i|
    if array[i].is_a?(Array)
      result << deep_dup(array[i])
      # p result.object_id #WTH?!
    else
      result << array[i]
    end
  end
  result
end

robot_parts = [
  ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]

# robot_parts_copy = deep_dup(robot_parts)
# p robot_parts_copy
# # shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# # but it does
# p robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]


def fib(n)
  return [] if n <= 0
  return [0] if n == 1
  return [0,1] if n == 2

  prev_fib = fib(n-1)
  next_fib = prev_fib[-1] + prev_fib[-2]
  prev_fib + [next_fib]
end


def fib(n)
  fibs = [0,1]
  return [] if n <= 0
  return [0] if n == 1
  return [0,1] if n == 2
  
  (2...n).each do |i|
    fibs << fibs[i-1] + fibs[i-2]
  end
  
  fibs
  
end

# p fib(5)

# def binary_search(array, target_value)
#   return nil if array.empty?
#   middle_index = array.length / 2
#   pivot = array[middle_index]
  
#   if target_value == pivot
#     return array.index(pivot)
    
#   elsif target_value > pivot
#     # p "This is #{array.index(pivot)}"
#     sub_array = array[middle_index..-1]
#     binary_search(sub_array, target_value) + middle_index
    
#   else
#     sub_array = array[0...middle_index]
#     binary_search(sub_array, target_value)
    
#   end
  

# end

# p binary_search([1, 2, 3, 4, 5], 5) # => 3
# p binary_search([2, 3, 4, 5], 3) # => 1
# p binary_search([2, 4, 6, 8, 10], 6) # => 2
# p binary_search([1, 3, 4, 5, 9], 5) # => 3
# p binary_search([1, 2, 3, 4, 5, 6], 6) # => 5
# p binary_search([1, 2, 3, 4, 5, 6], 0) # => nil
# p binary_search([1, 2, 3, 4, 5, 7], 6) # => nil




def merge_sort(arr)
  return arr if arr.length <= 1
  mid = arr.length / 2
  sub1 = arr[0...mid]
  sub2 = arr[mid..-1]

  merge(merge_sort(sub1), merge_sort(sub2))
end

def merge(sub1, sub2)
  result = []
  until sub1.empty? || sub2.empty?
    p sub1
    p sub2
    if sub1[0] <= sub2[0]
      result << sub1.shift
    else
    result << sub2.shift
    end
  end
  result + sub1 + sub2
end

# def deconstruct(array)
#   return array if array.length <= 1
#   mid = array.length/2
#   sub1 = array[0...mid]
#   sub2 = array[mid..-1]
#   merge(deconstruct(sub1), deconstruct(sub2))
# end



# # solution
# def merge_sort
#   return self if count < 2

#   middle = count / 2

#   left, right = self.take(middle), self.drop(middle)
#   sorted_left, sorted_right = left.merge_sort, right.merge_sort

#   merge(sorted_left, sorted_right)
# end

# def merge(left, right)
#   merged_array = []
#   until left.empty? || right.empty?
#     merged_array << ((left.first < right.first) ? left.shift : right.shift)
#   end

#   merged_array + left + right
# end

def subsets(arr)
  return [arr] if arr.empty?
  result = []
  subsets(arr[0..-2]) + 
end