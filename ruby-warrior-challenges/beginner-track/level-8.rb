##
# Level 8 challenge
# You feel a wall right in front of you and an opening behind you.
# 
# Use warrior.look to determine your surroundings, and warrior.shoot! to fire an arrow.
#

# Level 8 is getting fancy.. now we have wizards to take care! ah okay so we'll try and keep this simple,
# take a look around yourself, if you see an enemy, attack! If not, just do all the usual health checks, 
# free space, prisoner etc that we've already got in place.
#

class Player
  REST_HEALTH = 15
  FLEE_HEALTH = 7
  
  def play_turn(warrior)
    @last_known_health ||= warrior.health
    @direction ||= :forward
    feel_space = warrior.feel @direction
    glance = warrior.look @direction
    
    if glance.any? { |space| space.enemy? }
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
  