class Fixnum
	
	def in_words(pass_arr=nil)#,i=0)
		unless pass_arr
			as_array = self.to_s.split("")
		else
			as_array = pass_arr
		end
		ones = ['', 'one','two','three','four','five','six','seven','eight','nine']
		teens = ['ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']
		tens = ["", "",'twenty','thirty','forty','fifty','sixty','seventy','eighty','ninety']
		oom = [" hundred "," thousand "," million ", " billion ", " trillion "]
		#special zero case
		if as_array.length == 1 and as_array[0] == '0'
			return 'zero'
		end
		#deletes zeros
		until as_array[0] != '0' || as_array.length == 1
			as_array.shift
		end
		#begin base cases
		if as_array.length == 1
			return ones[as_array[0].to_i]
		elsif as_array.length == 2 and as_array[0] == '1'
			return teens[as_array[1].to_i]
		elsif as_array.length == 2
			if as_array[1] == '0'
				return tens[as_array[0].to_i]
			else return tens[as_array[0].to_i] + " " + ones[as_array[1].to_i]
			end
		#end base cases
		#special recursive case for hundreds
		elsif as_array.length == 3
			out = ones[as_array.shift.to_i] + " hundred "
				if as_array[0] == '0'
					out.chomp(" ")
				else out << self.in_words(as_array)
				end
			return out
		#split into groups of threes (i.e. thousands, millions, billions, etc...)
		else 
			order = as_array.length/3
			order_mod = as_array.length % 3
			next_order = []
			order_mod.times do 
				next_order.push(as_array.shift)
			end
			out = self.in_words(next_order) + oom[order] + self.in_words(as_array)
			return out.chomp(" ")
		end
	end

end


puts 10500070.in_words

