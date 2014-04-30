# Modify Array class to add sum, square, and square! methods


class Array
	def sum
		arr_sum = 0
		self.each do |element|
			arr_sum += element
		end
		arr_sum
	end
	
	def square
		self.map { |x| x * x }
	end
	
	def square!
		self.map! { |x| x * x }
	end

end