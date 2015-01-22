##
# Level 7 challenge
# You feel a wall right in front of you and an opening behind you.
# 
# You are not as effective at attacking backward. Use warrior.feel.wall? and warrior.pivot! to turn around.
#

# Level 7 introduces a major trick, you now need to turn by 180degrees to even be able to start! 
# new quirks into the mix. You're just staring at the wall, because we've always assumed a level 
# would interact from left to right.
#

class Player
 
  def play_turn(warrior)
 
    initialize
 
    is_taking_damage?(warrior)
    actions(warrior)
    record_health(warrior)
 
  end
 
  def initialize
  #sets up some necessary variable values
    @max_health = 20
    if @health == nil then @health = @max_health end 
  end
 
  def is_taking_damage?(warrior)
    #checks current health vs previous health to see if we are being attacked
    @under_attack = warrior.health < @health
  end
 
  def actions(warrior) 
  #potential actions the warrior can take to respond to situations
 
    if warrior.feel.wall? == true
      warrior.pivot!
    else
      if @under_attack == true and warrior.feel.empty? == true
        if warrior.health < 10
          warrior.walk!(:backward)
        else
          warrior.walk!
        end
      elsif @under_attack == true and warrior.feel.empty? == false
        if warrior.feel.captive?
          warrior.rescue!
        else
          warrior.attack!
        end
      elsif @under_attack == false and warrior.feel.empty? == true and warrior.health == @max_health
        warrior.walk!
      elsif @under_attack == false and warrior.feel.empty? == false and warrior.health == @max_health
        if warrior.feel.captive?
          warrior.rescue!
        else
          warrior.attack!
        end
      elsif @under_attack == false and warrior.health < @max_health
        warrior.rest!
      end
    end
  end
 
  def record_health(warrior)
  #recurds current health, where @health is equivilent to health from previous turn
    @health = warrior.health
  end
 
end
  