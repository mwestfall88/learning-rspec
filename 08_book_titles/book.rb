class Book
	attr_accessor :title
	
	def initialize
		@title = nil
	end
	
	def title=(book_title)
		book_title.capitalize!
		array_title = to_array(book_title)
		array_title.each do |word|
			if (conjunction?(word) || preposition?(word) || article?(word))
				next
			else word.capitalize!
			end
		end
		@title = to_string(array_title)
		return @title
	end
	
	
end

def to_array(title)
	return title.split(" ")
end

def to_string(array_title)
	title = ""
	array_title.each do |word|
		title += word + " "
	end
	return title.chomp(" ")
end

def conjunction?(word)
	if ['and', 'or', 'but'].include? word
		return true
	else return false
	end
end

def preposition?(word)
	if ['in', 'of'].include? word
		return true
	else return false
	end
end

def article?(word)
	if ['a','the','an'].include? word
		return true
	else return false
	end
end