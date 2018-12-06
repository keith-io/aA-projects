
class Array
    def my_uniq
        chars = Hash.new(0)
        self.each do |el|
            chars[el] += 1
        end
        chars.keys
        # self.uniq
    end

    def two_sum
        indices = []
        self.each_with_index do |num1, idx1|
            self.each_with_index do |num2, idx2|
                if idx1 < idx2 && num1 + num2 == 0
                    indices << [idx1, idx2]
                end
            end
        end
        indices
    end

    def my_transpose
        result = []
        i = 0
        while i < self.length
            j = 0
            sub_res = []
            while j < self.length
                sub_res << self[j][i]
                j += 1
            end 
            result << sub_res
            i += 1
        end 
        result
    end

    def stock_picker
        profit = 0
        i = 0
        while i < self.length
            j = i + 1
            while j < self.length
                if (self[j] - self[i]) > profit
                    profit = (j - i)
                    days = [i, j]
                end 
                j += 1
            end 
            i += 1
        end 
        days
    end 
    
end 

# if j - i > profit, then profit = j - i
# Write a method that takes an array of stock prices (prices on days 0, 1, ...), and outputs the most profitable pair of days on which to first buy the stock and then sell the stock. Remember, you can't sell stock before you buy it!

# profit = 0

# prices = [10, 5, 1, 7, 9] # => expect test arr = [2, 4]
#         d0. d1. d2. d3. d4
# let test array = Array.new
# spec: subject test array to receive method call