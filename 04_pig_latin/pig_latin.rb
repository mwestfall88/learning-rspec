def translate(phrase)
	phrase_array = phrase.split(" ")
	pig_phrase_array = []
	phrase_array.each do |word|
		word = to_array(word)
		letter_check = " "			
		word = q_check(word)
		until is_vowel?(word[0])
			letter_check = word.shift
			word.push(letter_check)
			word = q_check(word)
		end
		word += ['a','y']
		word = to_string(word)
		pig_phrase_array << word
	end
	pig_phrase = ""
	pig_phrase_array.each do |word|
		pig_phrase << word
		pig_phrase << " "
	end
	return pig_phrase.chomp(" ")
end
		
		
				
	
	

def to_array(word)
	return word.split("")
end

def to_string(word)
	word_string = ""
	word.each do |letter|
		word_string += letter
	end
	return word_string
end

def is_vowel?(letter)
	if ["a","e","i","o","u"].include?(letter)
		return true
	else
		return false
	end
end

def q_check(word)
	if word[0] == 'q' && word[1] == 'u'
		letters = word.shift(2)
		word += letters
	end
	return word
end
	
puts translate("quiet")