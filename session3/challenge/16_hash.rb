# Print to stdout, each element in a hash based linked list.
# If you don't know what that is, go check out the previous problem.
#
# EXAMPLES:
# head = {:data => 1, :next => nil}
# print_list head                    # >> "1\n"
# head = {:data => 2, :next => head}
# print_list head                    # >> "2\n1\n"
# head = {:data => 3, :next => head}
# print_list head                    # >> "3\n2\n1\n"
# head = {:data => 4, :next => head}
# print_list head                    # >> "4\n3\n2\n1\n"
# head = {:data => 5, :next => head}
# print_list head                    # >> "5\n4\n3\n2\n1\n"
# head = {:data => 6, :next => head}
# print_list head                    # >> "6\n5\n4\n3\n2\n1\n"

def print_list(hash)
  puts get_data(hash)
end

def get_data(hash, results =[])
  hash.each_value do |value|
    if value.is_a?(Hash)
      get_data(value, results)
    else
      results << value unless value == nil
    end
  end
  results
end

head = {:data => 1, :next => nil}
p print_list head
head = {:data => 2, :next => head}
head = {:data => 3, :next => head}
head = {:data => 4, :next => head}
head = {:data => 5, :next => head}
head = {:data => 6, :next => head}
p print_list head                    # >> "6\n5\n4\n3\n2\n1\n"
