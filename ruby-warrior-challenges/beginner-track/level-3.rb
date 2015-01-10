##
# Level 3 challenge
#
# It is too dark to see anything, but you smell sludge nearby.
# Use warrior.feel.empty? to see if there is anything in front of you, and warrior.attack! to fight it.  
# Remember, you can only do one action (ending in !) per turn.
#

# Okay... now we got health issues, plus more tasks at hand. 
# We need to take care of a couple things in this level:
# 1) Make sure health is up-to-date, we know max health is 20 beats (am referring to the number as beats!)
# 2) Kill slug if one present, there can be many!
# This demands a nest if-else loop, if there's a slug ahead, you have only one option - fight.
# But if space is clear, check if you have enough beats, we'll use comparision operator '==' here, 
# if your health doesn't allow, rest until you gain enough beats.
# else move ahead warrior!!
#


class Player
  def play_turn(warrior)
 
    if warrior.feel.empty? == false
        warrior.attack!
    else
      if warrior.health == 20
        warrior.walk!
      else
          warrior.rest!
      end
    end
 
  end
end
  