# Write a method, spiral_access, that takes a 2d square array (an array of arrays)
# and a block, and calls the block for each of the elements, in spiral order.
#
# HINT: This method is probably best sovled recursively
#
# Example:
# two_d = [
#   [ 1,  2,  3,  4, 5],
#   [16, 17, 18, 19, 6],
#   [15, 24, 25, 20, 7],
#   [14, 23, 22, 21, 8],
#   [13, 12, 11, 10, 9],
# ]
# order = []
# spiral_access two_d do |i|
#   order << i
# end
# order # => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25]

def spiral_access(two_d,&block)
  a = two_d.map(&:dup) # creating a duplicate so the original is not destryoed
  while a.flatten.any? && block_given?
    add = a.shift
    while add.any?
      block.call add.shift # calling the block on each element of the array
    end
    a = rotate_anticlockwise(a)
  end
end

def rotate_anticlockwise(array)
  array.map(&:reverse).transpose
end


# http://stackoverflow.com/questions/28837273/looping-in-a-spiral-outside-in
