class Loot
  def initialize
    fput "loot"
    waitrt?
    (1..2).each do
      fput "stow gem"
      fput "stow box"
    end
    (0..4).each do
      fput "get coin"
    end
  end
end
