class Loot
  attr_accessor :critter
  def initialize(critter)
    critter
    loot critter
  end

  def loot critter
    fput "search #{critter}"
    (0..4).each do
      fput "get coin"
    end
  end
end
