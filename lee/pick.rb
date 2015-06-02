class Pick
  attr_reader :picked, :no_picks
  PICK_CHECK = Regexp.union([
    /You are unable to make any progress towards opening the lock/,
    /just broke/,
    /Find a more appropriate tool and try again/,
    /You discover another lock protecting/,
    /Roundtime/,
    /not fully disarmed/,
  ])

  def initialize(box, difficulty)
    @box             = box
    @difficulty      = difficulty
    @picked          = false
    @broken_lockpick = false
    pick
  end

  def pick
    verb = "pick MY #{@box} #{@difficulty}"
    check = dothis verb, PICK_CHECK
    waitrt?
    picked? check
    pick unless @picked
  end

  def picked? check
    if(check =~ /You discover another lock protecting/ ||
      check =~ /You are unable to make any progress towards opening the lock/)
      @picked = false
    elsif(check =~ /Find a more appropriate tool and try again/)
      @no_picks = true
    else
      @picked = true
    end
  end
end
