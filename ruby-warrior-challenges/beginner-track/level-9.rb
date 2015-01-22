##
# Level 9 challenge
# Time to hone your skills and apply all of the abilities that you have learned.
#
# Watch your back.

# Level 9  
# Okay simply put, its alll thrown in together! But of course, this is the last of it all. 
# So really lets just put it all together, its all about the conditionals!
#

class Player
  REST_HEALTH = 15
  FLEE_HEALTH = 7
  MAX_GLANCE = 4
  
  def play_turn(warrior)
    @last_known_health ||= warrior.health
    @direction ||= :forward
    feel_space = warrior.feel @direction
    
    if clear_shot? warrior
      warrior.shoot!
    elsif feel_space.empty?
      if should_flee? warrior
        @direction = :backward
        warrior.walk! @direction
      elsif should_rest? warrior
        warrior.rest!
      else
        warrior.walk! @direction
      end
    elsif feel_space.captive?
      warrior.rescue! @direction
    elsif feel_space.wall?
      @direction = :forward
      warrior.pivot!
    else
      warrior.attack!
    end
    
    @last_known_health = warrior.health
  end
 
  private
  
  def clear_shot? warrior
    glance = warrior.look @direction
    distance_to_enemy = glance.index { |space| space.enemy? == true } || MAX_GLANCE
    distance_to_captive = glance.index { |space| space.captive? == true } || MAX_GLANCE
    safe?(warrior) && distance_to_enemy < distance_to_captive
  end
  
  def should_flee? warrior
    bad_health = warrior.health < FLEE_HEALTH
    !safe?(warrior) && bad_health
  end
  
  def should_rest? warrior
    bad_health = warrior.health < REST_HEALTH
    safe?(warrior) && bad_health
  end
  
  def safe? warrior
    warrior.health >= @last_known_health
  end
end
  