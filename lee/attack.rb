class Attack
  attr_accessor :killed, :no_critters
  DEAD_MATCHES = Regexp.union([/balanced]/, /balance]/, /Roundtime/, /Face what/, /There is nothing else to face/,
  /You aren't close enough to attack/,
  /Wouldn't it be better if you used a melee weapon/])

  def initialize(verb)
    @killed = false
    check = dothis(verb, DEAD_MATCHES)
    waitrt?
    @killed = killed? check
    @no_critters = no_critters? check
  end

  def killed? thing
    if(thing =~ /balance]/ ||
       thing =~ /balanced]/)
      true
    else
      false
    end
  end

  def no_critters? thing
    if(thing =~ /There is nothing else to face/                    ||
       thing =~ /You aren't close enough to attack/                ||
       thing =~ /Wouldn't it be better if you used a melee weapon/ ||
       thing =~ /There is nothing else to face/                    ||
       thing =~ /You aren't close enough to attack/)
      true
    else
      false
    end
  end
end
