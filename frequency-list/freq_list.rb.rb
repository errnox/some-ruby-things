require 'pp'


tokens = `man man`.split

data = tokens.inject({}) do |result, elm|
  char = elm.split('')[0]
  if result[char] == nil
    result[char] = [elm]
  else
    result[char] << elm
  end
  result
end

freq_list = {}
data.each do |char, tokens|
  freq_list[char] = tokens.length
end

pp freq_list
