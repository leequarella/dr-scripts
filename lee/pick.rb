class Pick
  attr_reader :picked, :broken_lockpick, :more_locks, :difficulty
  PICK_CHECK = Regexp.union([
    /You are unable to make any progress towards opening the lock/,
    /just broke/,
    /Find a more appropriate tool and try again/,
    /You discover another lock protecting/,
    /Roundtime/,
  ])

  def initialize(box, difficulty)
    @box             = box
    @difficulty      = difficulty
    @picked          = false
    @more_locks      = false
    @broken_lockpick = false
    pick
  end

  def pick
    verb = "pick MY #{@box} #{@difficulty}"
    check = dothis verb, PICK_CHECK
    waitrt?
    picked? check
    pick unless @picked || @broken_lockpick
  end

  def picked? check
    if(check =~ /You discover another lock protecting/)
      @more_locks = true
    elsif(
     check =~ /just broke/ ||
     check =~ /Find a more appropriate tool and try again/)
      @broken_lockpick = true
    elsif(
      check =~ /You are unable to make any progress towards opening the lock/)
      @picked = false
    else
      @picked = true
    end
  end
end
