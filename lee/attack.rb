class Attack
  attr_accessor :killed
  DEAD_MATCHES = Regexp.union([/balanced]/, /balance]/, /Roundtime/])

  def initialize(type)
    @killed = false
    CombatAssessment.new
    check = dothis(type, DEAD_MATCHES)
    waitrt?
    if killed? check
      killed_critter
    else
      @killed = false
    end
  end

  def killed? thing
    if(thing =~ /balance]/)
      true
    elsif(thing =~ /balanced]/)
      true
    else
      false
    end
  end

  def killed_critter
    @killed = true
  end
end
