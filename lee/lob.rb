class Lob
  def initialize(weapon, critter)
    attack weapon, critter
  end

  def attack weapon, critter
    fput "get #{weapon}"
    result = Attack.new("lob").killed
    waitrt?
    if result == true
      killed_critter
    end
  end

  def killed_critter
    Skin.new
    Loot.new
  end
end
