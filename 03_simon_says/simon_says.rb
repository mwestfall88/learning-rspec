def echo(word)
	return word
end

def shout(word)
	return word.upcase
end

def repeat(word, count=2)
	rep_words = word
	(count-1).times do
		rep_words += " #{word}"
	end
	return rep_words
end

def start_of_word(word, number)
	word_array = word.split("")
	string_return = ""
	word_array.each_with_index do |letter,i|
		break if i == number
		string_return += letter
	end
	return string_return	
end

def first_word(string)
	array_of_words = string.split(" ")
	return array_of_words[0]
end

def titleize(word)
	word.capitalize!
	word_array = word.split(" ")
	print word_array
	out_string = ""
	word_array.each do |word_to_cap|
		unless ["the","and","my","over"].include?(word_to_cap)
			word_to_cap.capitalize!
		end
		word_to_cap += " "
		out_string += word_to_cap
	end
	return out_string.chomp(" ")
end