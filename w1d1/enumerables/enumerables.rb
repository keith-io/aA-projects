require 'byebug'
class Array
  def my_each(&banana)
    index = 0
    while index < self.length
      banana.call(self[index])
      index += 1
    end
    self
  end

  def my_select(&prc)
    index = 0
    result = []
    while index < self.length
      result << self[index] if prc.call(self[index])
      index += 1
    end
    result
  end

  def my_reject
    index = 0
    result = []
    while index < self.length
      result << self[index] unless yield self[index] # prc.call(self[index])
      index += 1
    end
    result
  end

  def my_any?(&prc)
    index = 0
    while index < self.length
      return true if prc.call(self[index])
      index += 1
    end
    false
  end

  def my_all?(&prc)
    index = 0
    while index < self.length
      return false unless prc.call(self[index])
      index += 1
    end
    true
  end

  def my_flatten
    flattened = []
    index = 0
    while index < self.length
      if self[index].is_a?(Array)
        flattened += self[index].my_flatten # same as .concat
      else
        flattened << self[index]
      end
      index += 1
    end
    flattened
  end

  # def map_flat
  #   map { |el| el.is_a?(Array) ? el.map_flat : el }
  # end

  def my_zip(*args)
    result = []
    self.each_with_index do |ele, idx|
      result << [ele]
      args.each do |arg|
        result[idx] << arg[idx]
      end
    end
    result
  end

  def my_rotate(num = 1)
    self[(num % self.length)..-1] + self[0...(num % self.length)]
  end

  def my_join(separator = "")
    joined = ""
    self.each_with_index do |el, idx|
      if idx == self.length - 1
        joined << el
      else
        joined << el + separator
      end
    end
    joined
  end

  def my_reverse
    reversed = []

    self.each do |el|
      reversed.unshift(el)
    end
    reversed
  end

end


# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true


# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].map_flat # => [1, 2, 3, 4, 5, 6, 7, 8]
# p [1, 2, 3, [4]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# p a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]