class Attack
  attr_accessor :killed
  DEAD_MATCHES = Regexp.union([/balanced]/, /balance]/, /Roundtime/, /Face what/])

  def initialize(verb)
    @killed = false
    check = dothis(verb, DEAD_MATCHES)
    waitrt?
    if killed? check
      @killed = true
    else
      @killed = false
    end
  end

  def killed? thing
    if(thing =~ /balance]/)
      return true
    elsif(thing =~ /balanced]/)
      return true
    else
      return false
    end
  end
end
