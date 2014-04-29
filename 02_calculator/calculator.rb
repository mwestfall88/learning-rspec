def add(x,y)
	return x + y
end

def subtract(x,y)
	return x - y
end

def sum(num_array)
	sum = 0
	num_array.each do |num|
		sum += num
	end
	return sum
end

def multiply(num_array)
	product = 1
	num_array.each do |num|
		product *= num
	end
	return product
end

def power(num,exponent)
	power = 1
	exponent.times do
		power *= num
	end
	return power
end

def factorial(number)
	if number == 0
		return 1
	else
		return number*factorial(number-1)
	end
end