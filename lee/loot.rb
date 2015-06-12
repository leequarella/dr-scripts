class Loot
  GOT = Regexp.union([
    /You pick up/,
    /Stow what/,
    /./,
  ])

  LOOT = Regexp.union([
    /was carrying/,
    /anything/
  ])

  def initialize
    pause 1
    check = dothis "loot", LOOT
    waitrt?
    grab_stuff if check =~ /was carrying/
  end

  def grab_stuff
    things = ['nug', 'box', 'card', 'dira', 'gem', 'coin']
    things.each do |thing|
      more = true
      while more
        more = grab thing
      end
    end
  end

  def grab thing
    check = dothis "stow #{thing}", GOT
    if check =~ /Stow what/
      false
    else
      true
    end
  end
end
