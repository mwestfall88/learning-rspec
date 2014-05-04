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
					out.chomp!(" ")
				else 
					new_num = 0
					as_array.reverse!.each_with_index do |x, i| 
						new_num += x.to_i * 10**i
					end
					out << new_num.in_words
				end
			return out
		#split into groups of threes (i.e. thousands, millions, billions, etc...)
		else 
			order = (as_array.length-1)/3
			order_mod = as_array.length % 3
			order_mod = 3 if order_mod == 0
			next_order = []
			order_mod.times do 
				next_order.push(as_array.shift)
			end
			order_num =  0
			new_num = 0
			until as_array[0] != '0'
				as_array.shift
			end
			as_array.reverse!.each_with_index do |x, i| 
					new_num += x.to_i * 10**i
			end
			next_order.reverse!.each_with_index do |x, i| 
				order_num += x.to_i * 10**i
			end
			out = order_num.in_words + oom[order]
			if new_num > 0 
				out << new_num.in_words
			else
				out.chomp!(" ")
			end
			return out
		end
	end

end


print 2100000000.in_words