class SkillCheck
  def self.locked? skill
    thing = dothis("exp #{skill}", Regexp.union([/lock/, /EXP HELP/]))
    if(thing =~ /lock/)
      return true
    else
      return false
    end
  end
end
