# You have two different problems to solve, you must get which one it is from a hash
# The default value for the hash should be :count_clumps
# If no hash is provided, choose count_clumps
#
# PROBLEM: count_clumps
# Say that a "clump" in an array is a series of 2 or more adjacent elements of the same value.
# Return the number of clumps in the given arguments.
#
# problem_14 1, 2, 2, 3, 4, 4, :problem => :count_clumps    # => 2
# problem_14 1, 1, 2, 1, 1,    :problem => :count_clumps    # => 2
# problem_14 1, 1, 1, 1, 1,    :problem => :count_clumps    # => 1
#
#
# PROBLEM: same_ends
# Return true if the group of N numbers at the start and end of the array are the same.
# For example, with [5, 6, 45, 99, 13, 5, 6], the ends are the same for n=0 and n=2, and false for n=1 and n=3.
# You may assume that n is in the range 0..nums.length inclusive.
#
# The first parameter will be n, the rest will be the input to look for ends from
# problem_14 1,   5, 6, 45, 99, 13, 5, 6,  :problem => :same_ends    # => false
# problem_14 2,   5, 6, 45, 99, 13, 5, 6,  :problem => :same_ends    # => true
# problem_14 3,   5, 6, 45, 99, 13, 5, 6,  :problem => :same_ends    # => false

def problem_14(*numbers) # cannot specify an optional parameter at the end of spat! ref to link below
  selection = numbers.last.is_a?(Hash) ? numbers.pop : Hash.new
  selection[:problem] == :same_ends ? same_ends(*numbers) : count_clumps(*numbers)
end

def same_ends(*numbers)
  numbers = numbers.flatten # needs flattening when an array is given as input
  n = numbers.shift
  return false if numbers.length < n
  numbers.first(n) == numbers.last(n)
end

def count_clumps(*numbers) # used chunk method
  numbers.flatten.chunk{|a|a}.map{|y,ys| ys.count > 1 }.count(true) # needs flattening when array is given as input
end


# http://stackoverflow.com/questions/13960678/how-to-define-a-method-in-ruby-using-splat-and-an-optional-hash-at-the-same-time
