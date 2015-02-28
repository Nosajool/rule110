require 'spec_helper'

describe Rule110 do
	context "initialize" do
		it "should save the correct num" do
			game = Rule110.new(5)
			expect(game.num).to eq 5
		end

		it "should initialize empty rules" do
			game = Rule110.new(5)
			expect(game.rules).to eq({})
		end

		it "should initialize the array" do
			game = Rule110.new(5)
			expect(game.arr).to eq [0,0,0,0,1]
		end
	end

	context "add_rule" do
		before(:each) do
			@game = Rule110.new(5)
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
end
