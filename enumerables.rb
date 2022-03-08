
class Array
  def my_each(&prc)
    i = 0
    while i < self.length do
      prc.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&prc)
    newArr = []
    self.my_each  { |val| newArr << val if prc.call(val) }
    newArr
  end
  
  def my_reject(&prc)
    newArr = []
    self.my_each  { |val| newArr << val if !prc.call(val) }
    newArr
  end

  def my_any?(&prc)
    self.my_each  { |val| return true if prc.call(val) }
    false
  end

  def my_all?(&prc)
    self.my_each  { |val| return false if !prc.call(val) }
    true
  end

  def my_flatten
    newArr = Array.new(0)
    self.each do |val|
      if val.is_a?(Integer)
        newArr << val
      else
        newArr += val.my_flatten
      end
    end
    newArr
  end

  def my_zip(*elements)
    newArr = Array.new(self.length) {Array.new}
    
    (0...self.length).each do |i|
      newArr[i] << self[i]
      
      elements.each do |subArr|
        newArr[i] << subArr[i]
      end
    end
    newArr
  end

  def my_rotate(num=1)
    array = Array.new(0)
    self.each_with_index {|char,i| array[i] = char}
    abs = num.abs
    abs.times { rotate(array,num) }
    array
  end
  
  def rotate(array,num)
    if num > 0 
      first = array.shift
      array.push(first)
    else
      last = array.pop
      array.unshift(last) 
    end
  end

  def my_join(separator = "")
    str = ""
    self.each do |val|
      str << val + separator
    end
    separator == "" ? str : str[0...-1] 
  end

  def my_reverse
    newArr = Array.new(0)
    i = 0
    while i < self.length do 
      newArr << self[self.length-i-1]
      i += 1 
    end    
    newArr
  end
end

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]
# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

=begin
p a = [1, 2, 3]
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []

# calls my_each twice on the array, printing all the numbers twice.
return_value = [1, 2, 3].my_each do |num|
  puts num
end.my_each do |num|
  puts num
end
# => 1
2
3
1
2
3

p return_value  # => [1, 2, 3]
=end



















