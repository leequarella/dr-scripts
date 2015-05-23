class WeaponTrainer
  def initialize(data)
    @attack_type = data[:attack_type]
    @weapon      = data[:weapon]
    @left        = data[:left]

    prep @weapon if @weapon
    4.times do
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
    verb = "#{type} #{'left' if @left}"
    dead = Attack.new(verb).killed
    pause 1
    waitrt?
    killed_critter if dead
  end

  def killed_critter
    fput "************************ Killed Critter **************************"
    Skin.new
    Loot.new
  end
end
