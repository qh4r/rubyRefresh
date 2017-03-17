#Find the frequency of a string in a sentence
def find_frequency(sentence, word)
  sentence.scan(/#{word}/i).count
end

#Sort the words in a given sentence
def sort_string(string)
  string.split(' ').sort{|a, b| a.length - b.length}.join(' ')
end

#Select random elements from an array
def random_select(array, n)
  array.shuffle.take(n)
end

def random_select2(array, n)
  n.times.reduce([]) {|o,x| o.push(array[rand(array.length-1)])}
end

#Palindromes with no spaces
def palindrome?(sentence)
  word = sentence.downcase.gsub(' ','')
  word == word.reverse
end

#Find non-duplicate values in an Array
def non_duplicated_values(values)
  values.reduce(Hash.new(0)){|hash, key| hash[key]+=1; hash}
      .select {|k, v| v == 1}
      .keys
end

def non_duplicated_values2(values)
  values.select {|x| values.count(x) == 1}
end

#Check if all elements in an array are Fixnum
def array_of_fixnums?(array)
  array.all? {|a| a.is_a?(Fixnum)}
end

#Kaprekar's Number, examples:
#9 because 9 ^ 2 = 81 and 8 + 1 = 9
#297 because 297 ^ 2 = 88209 and 88 + 209 = 297.
def kaprekar?(k)
  first = (k ** 2).to_s
  first.slice!(-k.to_s.length..-1).to_i + first.to_i == k
end

#cubes
def sum_of_cubes(a, b)
  (a..b).reduce(0){|s,x| s + x**3}
end

#Contrast check, methods calling
class Color
  attr_reader :r, :g, :b
  def initialize(r, g, b)
    @r = r
    @g = g
    @b = b
  end

  def brightness_index
    (299*@r + 587*@g + 114*@b) / 1000
  end

  def brightness_difference(another_color)
    (brightness_index - another_color.brightness_index).abs
  end

  def hue_difference(another_color)
    (@r - another_color.r).abs + (@g - another_color.g).abs + (@b - another_color.b).abs
  end

  def enough_contrast?(another_color)
    brightness_difference(another_color) > 125 && hue_difference(another_color) > 500
  end
end

#Get timespan
def exec_time(proc)
  start = Time.now
  proc.call
  Time.now - start
end

#Return permutations of number digits
def number_shuffle(number)
  number.to_s.split('').permutation.to_a.map{|x| x.join('').to_i}
end

def number_shuffle2(number)
  number.to_s.split('').permutation.reduce([]) {|s,x| s.push(x.join('').to_i)}
end

#reduce table of hashes
class Restaurant
  def initialize(menu)
    @menu = menu
  end

  def cost(*orders)
    #o jeden reduce wiecej ale czytelniej
    #    orders.reduce(0) {|sum, x| sum += x.map{|key, val| @menu[key] * val }.reduce(0) {|sum, x| sum+=x}}
    #troche syf ale szybsze
    orders.reduce(0) {|sum, x| sum += x.reduce(0){|sum, arr| sum += @menu[arr[0]] * arr[1] }}
  end

  #dekompozycja slownika
  def cost2(*orders)
    orders.reduce(0) {|sum, x| sum += x.reduce(0){|sum, (k,v)| sum += @menu[k] * v}}
  end

#Run block or default action if no block provided
class MyArray
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def sum(initial_value = 0, &param)
    @array.reduce(initial_value) {|sum, x| sum += param.nil? ? x : param.call(x) }
  end

  def sum2(initial_value = 0)
    return array.inject(:+) + initial_value unless block_given?
    sum = initial_value
    array.each {|n| sum += yield(n) }
    sum
  end
end

#check fixnums
def array_of_fixnums?(array)
  array.all? {|x| x.is_a? Fixnum}
end
