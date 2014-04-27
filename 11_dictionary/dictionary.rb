class Dictionary
	attr_reader :entries
	
	def initialize
		@entries = {}
	end
	
	def add(hash)
		if hash.is_a?(Hash)
			@entries.merge!(hash)
		else 
			@entries[hash] = nil
		end
	end
	
	def keywords
		return @entries.keys.sort!
	end
	
	def include?(key)
		if @entries.include?(key)
			return true
		else return false
		end
	end
	
	def find(word)
		dup_entries = @entries
		to_a(word).each_with_index do |letter, index|
			@entries.delete_if { |key , value| to_a(key)[index] != letter}
		end
		return dup_entries
	end
	
	def printable
		print_string = ""
		@entries.sort.each do |key,value|
			print_string += "[#{key}] "+ '"' + "#{value}" + '"' + "\n"
		end
		return print_string.chomp("\n")
	end
	
end

def to_a(word)
	return word.split("")
end

d = Dictionary.new
d.add({'fish' => 'aquatic animal'})
d.add({'fiend' => 'mean person'})
puts d.printable