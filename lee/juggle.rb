class Juggle
  def initialize(item)
    fput "stow left"
    fput "stow right"
    fput "get my #{item}"
    fput "juggle my #{item}"
    waitrt?
    fput "put my #{item} in my robe"
  end
end
