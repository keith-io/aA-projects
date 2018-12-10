class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless self[key.hash].include?(key)
      if @count == num_buckets
        resize!
        self[key.hash] << key
        @count += 1
      else
        self[key.hash] << key
        @count += 1
      end
    end
  end
  
  def include?(key)
    self[key.hash].include?(key)
  end
  
  def remove(key)
    if self[key.hash].include?(key)
      self[key.hash].delete(key) 
      @count -= 1
    end
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
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0
    old_store.each do |bucket|
      until bucket.empty?
        insert(bucket.pop)
      end
    end
  end
end
