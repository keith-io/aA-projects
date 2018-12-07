class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    arr = self
    id = 1
    arr.each_with_index do |ele, i|
      id = ((ele).hash * i) % 20
    end
    id
  end
end

class String
  def hash
    # id = 0
    # self.each_char.with_index do |char, i|
    #   id += (char.ord).hash * i 
    # end
    # id
    new_string = self.chars.map { |ele| ele = ele.ord }
    new_string.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    id = 0
    self.each do |key, value|
      # p "this is the key #{key}"
      # p "this is the value #{value}"
      # p "hashing key: #{key.to_s.hash}"
      # p "hashing value: #{value.to_s.hash}"
      id += (key.hash + value.hash)
      # p id
    end
    id
  end
end