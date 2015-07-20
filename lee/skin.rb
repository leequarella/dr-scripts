class Skin
  ARRANGED = Regexp.union([
    /You complete/,
    /Roundtime/
  ])

  def initialize(arrange=nil)
    arrange_critter #if arrange
    skin
  end

  def arrange_critter
    check = dothis "arr", ARRANGED
    pause 0.2
    waitrt?
    arrange_critter if check =~ /Roundtime/
  end

  def skin
    fput "skin"
    waitrt?
  end
end
