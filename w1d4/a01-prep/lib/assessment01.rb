require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &block)
    result = []
    self.length.times do |accumulator, el|
      result << block.call(accumulator, el)
    end
    result
  end
  
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  (2..num / 2).each do |i|
    return false if num % i == 0
  end
  num >= 2
end

def primes(num)
  primes_arr = []
  i = 2
  until primes_arr.length == num
    primes_arr << i if is_prime?(i)
    i += 1
  end
  primes_arr
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  facs = []
  return [1] if num == 0
  return [1] if num == 1
  return [1, 1] if num == 2
  facs << factorials_rec(num - 1)
  facs
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    copies = {}
    self.each_with_index do |el, idx|
      copies.key?(el) ? copies[el] << idx : copies[el] = [idx]
    end
    copies.reject! {|key, _| copies[key].length <= 1 }
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    # return self.split(" ") if self.palindrome?
    subs = []
    palindrome = nil
    # until palindrome?
      # self.each_cons do |char|
    # end
    self.split(" ").each_with_index do |char, idx|
      subs << char
    end
    subs
  end

  def palindrome?
    first_half = self.split("").take(self.length / 2).join("")
    second_half = self.split("").drop(self.length / 2).reverse.join("")
    first_half == second_half
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    return [] if self.length == 0
    return [1] if self.length == 1

  end

  private
  def self.merge(left, right, &prc)

  end
end
