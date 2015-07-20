class Shooter
  def initialize(creature, weapon, ammo)
    take_weapon weapon
    ShootBow.new(weapon, ammo, creature)
    stow_weapon weapon
  end

  def take_weapon weapon
    if weapon == "crossbow"
      get_crossbow
    elsif weapon == "long"
      fput "remove my #{weapon}"
    else
      fput "take my #{weapon}"
    end
  end

  def stow_weapon weapon
    if weapon == "crossbow"
      stow_crossbow
    elsif weapon == "long"
      fput "wear my #{weapon}"
    else
      fput "stow my #{weapon}"
    end
  end

  def get_crossbow
    fput "untie crossbow"
  end

  def stow_crossbow
    fput "tie crossbow to braid tool"
  end
end
