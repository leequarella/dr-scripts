class Loot
  def initialize(critter)
    loot critter
  end

  def loot critter
    fput "loot"
    (0..4).each do
      fput "get coin"
      fput "stow gem"
      fput "stow box"
    end
  end
end
