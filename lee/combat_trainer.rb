class CombatTrainer
  def initialize(appr)
    @appr = appr
  end

  def next
    Tactics.new      unless SkillCheck.locked?("tactics")
    pause 1

    Debilitation.new unless SkillCheck.locked?("debilitation")
    pause 1

    Warding.new      unless SkillCheck.locked?("warding")
    pause 1

    Augmentation.new unless SkillCheck.locked?("augmentation")
    pause 1

    @appr.next        unless SkillCheck.locked?("appraisal")
    pause 1

    Perception.new   unless SkillCheck.locked?("perception")
    pause 1

    Expertise.new    unless SkillCheck.locked?("expertise")
    pause 1
  end
end
