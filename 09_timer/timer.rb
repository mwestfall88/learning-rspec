class Timer
	attr_accessor :seconds	
	
	def initialize
		@seconds = 0
	end
	
	def time_string
		#INTEGER DIVISION IS AWESOME!
		hrs = @seconds/3600
		mins = @seconds/60 - hrs*60
		secs = @seconds - mins*60 - hrs*3600
		return "#{padded(hrs)}:#{padded(mins)}:#{padded(secs)}"
	end
	
	def padded(i)
		if i >= 10
			return i.to_s
		else
			return "0" + i.to_s
		end
	end 
	
	
end