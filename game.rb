require_relative 'fourth'

game = Rule110.new(gets.to_i)
game.add_rule(1,1,1,0)
game.add_rule(1,1,0,1)
game.add_rule(1,0,1,1)
game.add_rule(1,0,0,0)
game.add_rule(0,1,1,1)
game.add_rule(0,1,0,1)
game.add_rule(0,0,1,1)
game.add_rule(0,0,0,0)

game.print_pic

