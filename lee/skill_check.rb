class SkillCheck
  attr_reader :locked
  def initialize(skill)
    @locked = locked? skill
  end

  def locked? skill
    thing = dothis("exp #{skill}", Regexp.union([/lock/, /EXP HELP/]))
    if(thing =~ /lock/)
      return true
    else
      return false
    end
  end

  def self.locked? skill
    thing = dothis("exp #{skill}", Regexp.union([/lock/, /EXP HELP/]))
    if(thing =~ /lock/)
      return true
    else
      return false
    end
  end
end
