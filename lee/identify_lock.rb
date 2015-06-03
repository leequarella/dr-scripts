class IdentifyLock
  attr_accessor :difficulty, :box, :picked, :trapped

  STILL_TRAPPED = Regexp.union([
    /not fully disarmed/,
    /Somebody has already/,
    /Roundtime/,
  ])
  IDENTIFIED_CHECKS = Regexp.union([
    /fails to teach you anything about the lock guarding it/,
    /Find a more appropriate tool and try again/,
    /not even locked, why bother?/,
    /trivially constructed gadget which you can take down any time/,
    /An aged grandmother could/,
    /you could do it blindfolded/,
    /trivially constructed piece of junk barely worth your time/,
    /will be a simple matter for you to unlock/,
    /should not take long with your skills/,
    /You think this lock is precisely at your skill level/,
    /with only minor troubles/,
    /lock has the edge on you, but you/,
    /You have some chance of being able to/,
    /odds are against you/,
    /would be a longshot/,
    /You have an amazingly minimal chance/,
    /You really don/,
    /Prayer would be a good start for any/,
    /You could just jump off a cliff and save/,
    /You probably have the same shot as a snowball/,
    /A pitiful snowball encased in the Flames/,
  ])

  def initialize(box)
    @box = box
    @difficulty == "not identified"
    identify
  end

  def identify
    verb = "PICK MY #{@box} IDEN"
    check_for_traps = dothis verb, STILL_TRAPPED
    trapped? check_for_traps
    if @trapped
      fput "**************IT'S STILL DAMN TRAPPED!!!!!!"
    else
      fput "*******Safe to pick. Not trapped."
      check_difficulty
    end
  end

  def check_difficulty
    verb = "PICK MY #{@box} IDEN"
    check = dothis verb, IDENTIFIED_CHECKS
    waitrt?
    difficulty? check
    if @difficulty == "not identified"
      identify
    end
  end

  def trapped? check
    @trapped = (check =~ /not fully disarmed/)
  end

  def difficulty? check
    if(check =~ /lock has the edge on you, but you/ ||
     check =~ /You have some chance of being able to/ ||
     check =~ /odds are against you/ ||
     check =~ /would be a longshot/ ||
     check =~ /You have an amazingly minimal chance/)
      @difficulty = "careful"

    elsif(check =~ /You really don/ ||
     check =~ /Prayer would be a good start for any/ ||
     check =~ /You could just jump off a cliff and save/ ||
     check =~ /You probably have the same shot as a snowball/ ||
     check =~ /A pitiful snowball encased in the Flames/)
      #@difficulty = "Too Hard"
      @difficulty = "careful"

    elsif(check =~ /lock has the edge on you, but you/ ||
     check =~ /You have some chance of being able to/ ||
     check =~ /odds are against you/ ||
     check =~ /would be a longshot/ ||
     check =~ /You have an amazingly minimal chance/)
      @difficulty = "careful"

    elsif(check =~ /trivially constructed piece of junk barely worth your time/ ||
     check =~ /will be a simple matter for you to unlock/ ||
     check =~ /should not take long with your skills/ ||
     check =~ /You think this lock is precisely at your skill level/ ||
     check =~ /with only minor troubles/)
      @difficulty = "quick"

    elsif(check =~ /trivially constructed gadget which you can take down any time/ ||
     check =~ /An aged grandmother could/ ||
     check =~ /you could do it blindfolded/)
      @difficulty = "blind"

    elsif(check =~ /not even locked, why bother?/)
      @difficulty = "open"

    elsif(check =~ /Find a more appropriate tool and try again/)
      @difficulty = "broken lockpick"

    else
      @difficulty = "not identified"
    end
  end
end
