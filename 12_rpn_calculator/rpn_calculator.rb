class RPNCalculator

	def initialize
		@stack = []
	end
	
	def push(num)
		@stack.push(num)
	end
	
	def check_length
		raise "calculator is empty" if @stack.length < 2
	end
	
	def plus
		check_length
		a = @stack.pop
		b = @stack.pop
		@stack.push(a + b)
	end
	
	def minus
		check_length
		a = @stack.pop
		b = @stack.pop
		@stack.push(b - a)
	end
	
	def divide
		check_length
		a = @stack.pop.to_f
		b = @stack.pop.to_f
		@stack.push(b/a)
	end
	
	def times
		check_length
		a = @stack.pop.to_f
		b = @stack.pop.to_f
		@stack.push(b * a)
	end
	
	def value
		dup_stack = @stack.clone
		dup_stack.pop
	end
	
	def tokens(token_string)
		token_array = token_string.split(" ")
		token_array.map! do |element|
			if ['*','+','/','-'].include?(element)
				element.to_sym
			else element.to_i
			end
		end
		token_array
	end
	

	def evaluate(str)
		@stack = tokens(str)
		ops_arr = []
		until @stack.length == 1
			while @stack[-1].is_a? Symbol
				ops_arr.push(@stack.pop)
			end
			#This checks if the NEXT element of @stack is a symbol
			a = @stack.pop
			if @stack[-1].is_a? Symbol
				ops_arr.push(a)
				next
			elsif !ops_arr[-1].is_a? Symbol
				@stack.push(ops_arr.pop)
				operation = ops_arr.pop
			else
				@stack.push(a)
				operation = ops_arr.pop
			end
			case operation
			when :+
				plus
			when :-
				minus
			when :*
				times
			when :/
				divide
			end
			#Checks if length
			if ops_arr[-1].is_a? Integer
				@stack.push(ops_arr.pop)
			end
		end
		value
	end
	
end


calc = RPNCalculator.new
puts calc.evaluate ("1 2 3 * + 4 5 - /")



