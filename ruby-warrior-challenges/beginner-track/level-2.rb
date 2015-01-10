##
# Level 2 challenge
#
# It is too dark to see anything, but you smell sludge nearby.
# Use warrior.feel.empty? to see if there is anything in front of you, and warrior.attack! to fight it.  
# Remember, you can only do one action (ending in !) per turn.
#

# Simple if you take the hidden hint, it specifies that "you can only do one action (ending in !) per turn"
# that means, there has to be conditionals. Use if-else condition to chose what to do.
# If space ahead is empty, move forward, if not (else) fight the slug.
# Success in 1st attempt.

class Player
  def play_turn(warrior)
    if warrior.feel.empty?
      warrior.walk!()
    else
      warrior.attack!
    end
  end
end