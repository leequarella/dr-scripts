class MechLore
  DONE = Regexp.union([/You stop, realizing/,
                       /You need to have more material in your other hand to continue braiding/,
                       /wasted effort/,
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
    if screwed_up?(check)
      fput "drop grass"
      fput "drop grass"
    elsif !braided?(check)
      braid
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
    if(thing =~ /wasted effort/)
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
