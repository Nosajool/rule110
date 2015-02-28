class Rule110
	attr_accessor :num
	attr_accessor :rules
	attr_accessor :temp
	attr_accessor :arr

	def initialize(num)
		@num = num
		@rules = {}
		init_array
	end

	def	add_rule(*arr,rule)
		@rules[arr] = rule
	end

	def init_array
		@arr = []
		(1..@num-1).each do |n|
			@arr << 0
		end
		@arr << 1
	end

	def print_first_row
		@arr.each {|n| print n}
		puts
	end

	def print_row
		@temp = []
		@temp[0] = @rules[[0,@arr[0], @arr[1]]]
		for i in 1..(@num-2) do
			@temp[i] = @rules[[@arr[i-1],@arr[i],@arr[i+1]]]
		end
		@temp << 1
		@temp.each { |n| print n}
		puts
		@arr = @temp
	end

	def print_rest
		for j in 0..(@num-2) do
			print_row
		end
	end

	def print_pic
		print_first_row	
		print_rest
	end
end

