##
# Level 1 challenge
# 
# You see before yourself a long hallway with stairs at the end. There is nothing in the way.
# Call warrior.walk! to walk forward in the Player 'play_turn' method.
# 

# Pretty simple! Just make the warrior using the predefined warrior.walk! function. 
# Success in 1st attemp.

class Player
  def play_turn(warrior)
    warrior.walk!()
  end
end