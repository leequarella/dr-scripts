class WeaponTrainer
  def initialize(data)
    @attack_type = data[:attack_type]
    @weapon      = data[:weapon]
    @left        = data[:left]

    prep @weapon if @weapon
    5.times do
      attack(@attack_type)
      pause 1
      waitrt?
    end
    fput "she #{@weapon}" if @weapon
  end

  def prep(weapon)
    fput "wield #{weapon}"
    fput "swap" if @left
  end

  def attack(type)
    verb   = "#{type} #{'left' if @left}"
    attack = Attack.new(verb)
    dead        = attack.killed
    no_critters = attack.no_critters
    pause 1
    waitrt?
    killed_critter if dead
    no_critter if no_critters
  end

  def killed_critter
    fput "************************ Killed Critter **************************"
    Skin.new
    Loot.new
  end

  def no_critter
    fput "************************ No critter to attack. **************************"
  end
end
