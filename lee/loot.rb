class Loot
  def initialize
    fput "loot"
    (0..4).each do
      fput "get coin"
      fput "stow gem in black pou"
      fput "stow box in pack"
    end
  end
end
