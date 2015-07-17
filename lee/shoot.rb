class ShootBow
  def initialize(weapon, ammo, creature)
    @ammo = ammo
    attack_with weapon
  end

  def attack_with weapon
    fput "load"
    pause 1
    waitrt?
    2.times do
      fput "aim"
      pause 1
      waitrt?
    end
    waitfor "You think you have your best shot possible now"
    result = Attack.new("shoot").killed
    pause 1
    waitrt?
    if result == true
      killed_critter
    end
  end

  def killed_critter
    RecoverAmmo.new(@ammo)
    Skin.new
    Loot.new
  end
end
