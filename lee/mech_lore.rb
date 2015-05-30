class MechLore
  DONE = Regexp.union([/You stop, realizing/,
                       /You need to have more material in your other hand to continue braiding/,
                       /You are certain that the braided grass is nothing more than wasted effort/,
                       /Roundtime/])
  HANDS = Regexp.union([/You glance down to see some braided grass in your left hand/,
                        /You glance down to see some grass in your right hand and some grass in your left hand/,
                        /You glance down to see some grass in your right hand and some braided grass in your left hand/,
                        /You glance down at your empty hands/,
                        /You glance down to see some grass in your right hand and nothing in your left hand/,
                       ])
  def initialize
    check = dothis('glance', HANDS)
    if have_grass? check
      braid
    else
      get_grass
    end
  end

  def get_grass
    check = dothis('glance', HANDS)
    if have_grass? check
      braid
    else
      fput "forage grass"
      waitrt?
      get_grass
    end
  end

  def braid
    command = "braid my grass with my grass"
    check = dothis(command, DONE)
    waitrt?
    if !braided?(check)
      braid
    elsif screwed_up?(check)
      fput "drop grass"
      fput "drop grass"
    end
  end

  def braided? thing
    if(thing =~ /You stop, realizing/)
      true
    elsif(thing =~ /You need to have more material in your other hand to continue braiding/)
      true
    else
      false
    end
  end

  def screwed_up? thing
    if(thing =~ /You are certain that the braided grass is nothing more than wasted effort/)
      true
    else
      false
    end
  end

  def have_grass? thing
    if(thing =~ /You glance down to see some grass in your right hand and some grass in your left hand/)
      true
    elsif(thing =~ /You glance down to see some grass in your right hand and some braided grass in your left hand/)
      true
    else
      false
    end
  end
end
