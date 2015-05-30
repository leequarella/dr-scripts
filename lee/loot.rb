class Loot
  def initialize
    fput "loot"
    waitrt?
    fput "stow nug"
    fput "stow box"
    (1..2).each do
      fput "stow gem"
    end
    (0..4).each do
      fput "get coin"
    end
  end
end
