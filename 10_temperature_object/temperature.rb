class Temperature
	 def initialize(temp_hash)
	 	@temps = temp_hash
	 	if @temps[:f]
	 		@temps[:c] = (@temps[:f] - 32) * (5.0/9.0)
	 	else
	 		@temps[:f] = @temps[:c] * (9.0/5.0) + 32
	 	end
	 end
	 
	 def in_fahrenheit
	 	return @temps[:f]
	 end
	 
	 def in_celsius
	 	return @temps[:c]
	 end
	 
	 def self.from_celsius(temp)
	 	temp_hash = {:c => temp}
	 	new temp_hash
	 end
	 
	 def self.from_fahrenheit(temp)
	 	temp_hash = {:f => temp}
	 	new temp_hash
	 end
	 
end


class Celsius < Temperature
	def initialize(temp)
		super(:c => temp)
	end
end

class Fahrenheit < Temperature
	def initialize(temp)
		super(:f => temp)
	end
end