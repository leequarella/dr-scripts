class Alchemy
  CRUSHED = Regexp.union([/You stop, realizing/, /Roundtime/])
  def initialize
    fput "stow left"
    fput "stow right"
    prep_morter
    fput "get my pestle"
    crush
  end

  def prep_morter
    fput "get my mortar"
    empty_mortar
    fill_mortar
  end

  def empty_mortar
    fput "tilt my mortar"
    fput "tilt my mortar"
    waitrt?
  end

  def fill_mortar
    fput "forage blue flower"
    pause 1
    waitrt?
    fput "put my flower in my mortar"
  end

  def crush
    command = "crush flow in my mort with my pest"
    check = dothis(command, CRUSHED)
    waitrt?
    unless crushed?(check)
      crush
    end
  end

  def crushed? thing
    if(thing =~ /You stop, realizing/)
      true
    else
      false
    end
  end
end
