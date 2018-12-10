require 'byebug'
class MaxIntSet
  def initialize(max)
    @store = Array.new(max) { false }
  end

  def insert(num)
    unless is_valid?(num)
      raise "Out of bounds"
    else
      @store[num] = true
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num < @store.length && num >= 0
  end

  def validate!(num)
    # why do we need this...?
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless self[num].include?(num)
      if @count == num_buckets
        resize!
        self[num] << num 
        @count += 1
      else
        self[num] << num
        @count += 1
      end
    end
  end

  def remove(num)
    if self[num].include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @store = Array.new(@store.length * 2) { Array.new }
    @count = 0
    old_store.each do |bucket|
      until bucket.empty?
        self.insert(bucket.pop)
      end
    end
  end
end
