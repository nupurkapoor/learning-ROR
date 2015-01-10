##
# Level 4 challenge
#
# You can hear bow strings being stretched.
# No new abilities this time, but you must be careful not to rest while taking damage.  
# Save a @health instance variable and compare it on each turn to see if you're taking damage.
#

# Okay... now we got health issues, and a bow arrow guy! 
# We need to take care of resting, slugs and the arrows in this level:
# 1) Make sure health is up-to-date, we know max health is 20 beats (am referring to the number as beats!)
# 2) Kill slug if one present, there can be many!
# 3) Look out for a man with bow, attack if present
# This demands a nest if-else loop, if there's a slug ahead, you have only one option - fight.
# But if space is clear, check if you have enough beats, we'll use comparision operator '==' here, 
# if your health doesn't allow, rest until you gain enough beats.
# else move ahead warrior!!

# We need to plan our actions so that we don’t simply heal after we’ve killed an enemy and 
# there is no enemy in front of us, but so that we only rest when we are not taking damage. 
# We need to define “taking damage” as whether our health has declined since our last turn. 
# In order to do this, we need to define a variable for “health” so we can compare current health to previous health.
#
# Apart from all that, this is level 4 now, we are expected to step up our game and introduce variables and 
# structure our code with self defined methods, aprt from the ones already available.
# -- Set max_health = 20
# -- Set @health default value if “nil”
# -- Save current health to @health
# -- Determine if we are taking damage (true or false) by comparing previous health with current health


class Player
 
  def play_turn(warrior)
 
    @max_health = 20
    if @health == nil then @health = @max_health end
 
    taking_damage(warrior)
    warrior_actions(warrior)
    monitor_health(warrior)
 
  end
 
  def taking_damage(warrior)
    # compare current health vs previous health to see if we are being attacked
    @under_attack = @health > warrior.health
  end
 
  def warrior_actions(warrior) 
  # actions that the warrior can take to respond to situations
    if @under_attack == true and warrior.feel.empty? == true
      warrior.walk!
    elsif @under_attack == true and warrior.feel.empty? == false
      warrior.attack!
    elsif @under_attack == false and warrior.feel.empty? == true and warrior.health == @max_health
      warrior.walk!
    elsif @under_attack == false and warrior.feel.empty? == false and warrior.health == @max_health
      warrior.attack!
    elsif @under_attack == false and warrior.health < @max_health
      warrior.rest!
    end
  end
 
  def monitor_health(warrior)
    @health = warrior.health
  end
 
end
  