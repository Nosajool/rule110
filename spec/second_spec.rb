require 'spec_helper'

describe Rule110 do
	context "initialize" do
		it "should save the correct num" do
			game = Rule110::Game.new(5)
			expect(game.num).to eq 5
		end

		it "should initialize empty rules" do
			game = Rule110::Game.new(5)
			expect(game.rules).to eq({})
		end

		it "should initialize the array" do
			game = Rule110::Game.new(5)
			expect(game.arr).to eq [0,0,0,0,1]
		end
	end

	context "add_rule" do
		before(:each) do
			@game = Rule110::Game.new(5)
		end

		it "should accept and save a rule" do
			@game.add_rule(0,0,0,1)
			expect(@game.rules.size).to eq 1
			expect(@game.rules[[0,0,0]]).to eq 1
		end

		it "should overwrite rules if same array given" do
			@game.add_rule(0,0,0,1)
			expect(@game.rules.size).to eq 1
			@game.add_rule(0,0,0,0)
			expect(@game.rules.size).to eq 1
			expect(@game.rules[[0,0,0]]).to eq 0
		end
	end

	context "init_array" do
		it "should initialize the first row" do
			game = Rule110::Game.new(5)
			game.arr = [1,1,1,1,1]
			game.init_array
			expect(game.arr).to eq [0,0,0,0,1]
		end	
	end

	context "puts_row" do
		it "should print the given array" do
			game = Rule110::Game.new(5)
			expect { game.puts_row([0,1,1,0,1]) }.to output("01101\n").to_stdout
		end
	end

	describe "tests involving rules" do
		before(:each) do
			@game = Rule110::Game.new(5)
			@game.add_rule(1,1,1,0)
			@game.add_rule(1,1,0,1)
			@game.add_rule(1,0,1,1)
			@game.add_rule(1,0,0,0)
			@game.add_rule(0,1,1,1)
			@game.add_rule(0,1,0,1)
			@game.add_rule(0,0,1,1)
			@game.add_rule(0,0,0,0)
		end

		context "calculate_and_print_next_row" do
			it "should print the next row based on inputted rules" do
				expect { @game.calculate_and_print_next_row }.to output("00011\n").to_stdout
			end
		end

		context "print_rest" do
			it "should print out the last 4 rows" do
				expect { @game.print_rest }.to output("00011\n00111\n01101\n11111\n").to_stdout
			end
		end

		context "print_pic" do
			it "should print out Rule110" do
				expect { @game.print_pic }.to output("00001\n00011\n00111\n01101\n11111\n").to_stdout
			end
		end
	end
end
