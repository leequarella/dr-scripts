class MechLore
  DONE = Regexp.union([/You stop, realizing/, /Roundtime/])
  def initialize
    fput "stow left"
    fput "stow right"
    get_grass
    get_grass
  end

  def get_grass
    Regexp.union([/You glance down to see some braided grass in your left hand/
    ])


    fput "forage grass"
    waitrt?
  end

  def braid
    command = "braid grass with grass"
    check = dothis(command, DONE)
    waitrt?
    unless braided?(check)
      braid
    end
  end

  def braided? thing
    if(thing =~ /You stop, realizing/)
      true
    else
      false
    end
  end
end
