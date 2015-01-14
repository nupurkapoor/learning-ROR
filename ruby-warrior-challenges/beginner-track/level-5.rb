##
# Level 5 challenge
#
# You hear cries for help. Captives must need rescuing.
# Use warrior.feel.captive? to see if there is a captive and warrior.rescue! to rescue him. 
# Don't attack captives. 
#

# Level 5 is simple, with the introduction of captives - harmless entities!
# To beat this level we simply need to feel for a captive, and react appropriately. 
# As the captives are NOT enemies but innocent, all I need to do is add conditional 
# anywhere I would previously attack if the space in front was NOT empty. 
#

class Player
 
  def play_turn(warrior)
 
    @max_health = 20
    if @health == nil then @health = @max_health end
 
    taking_damage(warrior)
    warrior_actions(warrior)
    monitor_health(warrior)
 
  end
 
  def taking_damage(warrior)
    #checks current health vs previous health to see if we are being attacked
    @under_attack = @health > warrior.health
  end
 
  def warrior_actions(warrior) 
  #potential actions the warrior can take to respond to situations
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
    elsif @under_attack == false and warrior.feel.captive? == true
      warrior.rescue!
    end
  end
 
  def monitor_health(warrior)
  #recurds current health, where @health is equivilent to previous health
    @health = warrior.health
  end
 
end
  