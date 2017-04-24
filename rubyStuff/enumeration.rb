def validate(n)
  input = n.to_s
  (input.split('').each_with_index.reduce(0) do |sum, elem_with_index|
    processed = ((input.length.even? and elem_with_index[1].even?) or (input.length.odd? and elem_with_index[1].odd?)) ? (elem_with_index[0].to_i*2) : elem_with_index[0].to_i
    sum += processed > 9 ? processed - 9 : processed
    sum
  end % 10) == 0
end

#fajne ale dla reduce with_index nie dziala i trzeba uzywac each_with_index jak wyzej
def validate2 (n)
  input = n.to_s
  input.split('').map.with_index(0) do |elem, index|
    return (elem*2) % 10 if (input.length.even? and index.even?) or (input.length.odd? and index.odd?)
    return elem
  end
end

#uzycie &:
def validate3(n)
  n.to_s
      .split(//)
      .map(&:to_i)
      .reverse
      .map
      .with_index { |e,i| i.even? ? e:e*2  }
      .reverse
      .map { |x| x > 9 ? x-9 : x }
      .reduce(&:+) % 10 == 0
end

#mozna dobrac sie do argumentow tablicy [x,y] przez (x,y)
def validate4(n)
  digits = n.to_s.chars.map(&:to_i)
  digits.reverse.each_with_index.inject(0) { |sum, (digit, index)|
    sum + (index.odd? && digit < 9 ? digit * 2 % 9 : digit)
  } % 10 == 0
end

#flatmap example
res = ([1,2,3,4,5].map.with_index {|x, i| (0..i).to_a.map.with_index {|y,j| y * j * i} }).reduce(&:+)
