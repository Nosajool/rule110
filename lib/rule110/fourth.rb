module Rule110
  class Game
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

    def puts_row(array)
      array.each {|n| print n}
      puts
    end

    def calculate_and_print_next_row
      @temp = []
      @temp[0] = @rules[[0,@arr[0], @arr[1]]]
      for i in 1..(@num-2) do
        @temp[i] = @rules[[@arr[i-1],@arr[i],@arr[i+1]]]
      end
      @temp << 1
      puts_row(@temp)
      @arr = @temp
    end

    def print_rest
      for j in 0..(@num-2) do
        calculate_and_print_next_row
      end
    end

    def print_pic
      puts_row(@arr)
      print_rest
    end
  end
end
