# binary search always assumes a sorted array
def bsearch(nums, target)
  return nil if nums.empty?

  probe_index = nums.length / 2
  case target <=> nums[probe_index]
  when -1
    bsearch(nums.take(probe_index), target) #target is less than probe_index
  when 0
    probe_index 
  when 1
    sub_array = bsearch(nums.drop(probe_index + 1), target) #target is greater than probe_index
    sub_array.nil? ? nil : (probe_index + 1) + sub_array
  end
end

p bsearch([1,2,3,4,5], 4)
p bsearch([1,2,3,4,5], 3)
p bsearch([1,2,3,5], 4)
p bsearch([1,2,3,5], 3)
p bsearch([1,2,3,4], 1)
p bsearch([1,2,3,4,5], 1)
