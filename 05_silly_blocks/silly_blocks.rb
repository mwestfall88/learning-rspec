def reverser
	result = to_array(yield)
	reversed_phrase = ""
	result.each do |word|
		reversed_phrase += word.reverse! + " "
	end
	return reversed_phrase.chomp(" ")
end

def adder(n=1)
	return n + yield
end

def repeater(x=1)
	return x.times {yield}
end
	


def to_array(phrase)
	return phrase.split(" ")
end

def to_string(phrase_array)
	phrase = ""
	phrase_array.each do |word|
		phrase += word
	end
	return phrase
end


