##
# Level 6 challenge
# The wall behind you feels a bit further away in this room. And you hear more cries for help.
# 
# You can walk backward by passing ':backward' as an argument to walk!. 
# Same goes for feel, rescue! and attack!. Archers have a limited attack distance.
#

# Level 6 introduces two new quirks into the mix. To defeat this level, we'll first need to 
# teach our warrior to flee for his life when appropriate. 
# You may now need to move backward to save a poor soul, still saving yourself from bows and slugs!
#

class Player
   
  def play_turn(warrior)
   
    initialize
   
    taking_damage(warrior)
    warrior_actions(warrior)
    monitor_health(warrior)
 
  end
   
  def initialize
  #sets up necessary variable values
    @max_health = 20
    if @health == nil then @health = @max_health end 
  end
   
  def taking_damage(warrior)
    #checks current health vs previous health to see if we are being attacked
    @under_attack = warrior.health < @health
  end
 
  def warrior_actions(warrior) 
  #potential actions the warrior can take to respond to situations
   
    if warrior.feel(:backward).empty? == true and @rescue_count != 1
      warrior.walk!(:backward)
    elsif warrior.feel(:backward).empty? == false
      warrior.rescue!(:backward)
      @rescue_count = 1
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
   
  def monitor_health(warrior)
  #recurds current health, where @health is equivilent to health from previous turn
    @health = warrior.health
  end
   
end
  