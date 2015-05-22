class WeaponTrainer
  WEAPONS = ["Telek", "Spatha"]
  def initialize(critter="sprite", weapon=nil, left=nil)
    @weapon  = weapon
    @left    = left
    @critter = critter
    fput 'stow left'
    fput 'stow right'

    prep weapon unless weapon == "brawling"
    4.times do
      if weapon == "brawling"
        attack "punch"
      else
        attack("jab left")
      end
      pause 1
      waitrt?
    end
    fput "she #{@weapon}"
  end

  def prep(weapon)
    empty_hands
    fput "wield #{weapon}"
    fput "swap" if @left
  end

  def attack(type)
    dead = Attack.new(type).killed
    pause 1
    waitrt?
    killed_critter if dead
  end

  def empty_hands
    fput "she left"
    fput "she right"
  end

  def killed_critter
    fput "************************ Killed #{@critter} **************************"
    Skin.new
    Loot.new(@critter)
  end
end
