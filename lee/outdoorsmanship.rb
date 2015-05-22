class Outdoorsmanship
  def initialize(thing="rock")
    fput "stow left"
    fput "stow right"
    fput "collect #{thing}"
    waitrt?
    fput "kick #{thing}"
  end
end
