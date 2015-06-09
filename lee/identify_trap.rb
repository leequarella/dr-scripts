class IdentifyTrap
  attr_reader :difficulty, :box, :disarmed

  IDENTIFIED = Regexp.union([
    /fails to reveal to you what type of trap protects it/,
    /something to shift/,
    /You have an amazingly minimal chance/,
    /have any chance/,
    /You could just jump off a cliff and save/,
    /You probably have the same shot as a snowball/,
    /A pitiful snowball encased in the Flames/,
    /with only minor troubles/,
    /should not take long with your skills/,
    /trap has the edge on you/,
    /You have some chance of being able to disarm/,
    /odds are against you/,
    /would be a longshot/,
    /Prayer would be a good start for any/,
    /covered black scarab of some unidentifiable substance clings to the/,
    /are covered with a thin metal circle that has been lacquered with/,
    /trivially constructed gadget which you can take down any time/,
    /This trap is a laughable matter, you could do it blindfolded/,
    /An aged grandmother could defeat this trap in her sleep/,
    /will be a simple matter for you to disarm/,
    /You think this trap is precisely at your skill level/,

    /A row of concealed openings on the front of the strongbox/,
    /It seems far enough away from the lock to be harmless/,
    /A bent needle sticks harmlessly/,
    /that the dart has been moved too far out of position for the mechanism to function properly/,
    /but whatever it was has been pried out/,
    /indicating the trap is no longer a danger/,
    /rendering it harmless/,
    /have been bent in such a way that they no longer will function/,
    /trap harmless/,
    /a tiny metal lever has been bent away from the casing/,
    /rests a small deflated bladder/,
    /You deem it quite safe/,
    /You guess it is already disarmed/,
    /have been bent/,
  ])

  def initialize(box)
    @box = box
    identify
  end

  def identify
    verb = "DISARM MY #{@box} iden"
    check = dothis verb,  IDENTIFIED
    waitrt?
    difficulty? check
    if @difficulty == "not identified"
      identify
    end
  end

  def difficulty? check
    if(check =~ /with only minor troubles/ ||
     check =~ /should not take long with your skills/ ||
     check =~ /trap has the edge on you/ ||
     check =~ /You have some chance of being able to disarm/ ||
     check =~ /odds are against you/ ||
     check =~ /would be a longshot/ ||
     check =~ /Prayer would be a good start for any/ ||
     check =~ /covered black scarab of some unidentifiable substance clings to the/ ||
     check =~ /are covered with a thin metal circle that has been lacquered with/)
      @difficulty = "careful"

    elsif(check =~ /You have an amazingly minimal chance/ ||
     check =~ /have any chance/ ||
     check =~ /You could just jump off a cliff and save/ ||
     check =~ /You probably have the same shot as a snowball/ ||
     check =~ /A pitiful snowball encased in the Flames/)
      @difficulty = "too hard"

    elsif(check =~ /trivially constructed gadget which you can take down any time/ ||
    check =~ /This trap is a laughable matter, you could do it blindfolded/ ||
    check =~ /An aged grandmother could defeat this trap in her sleep/)
      @difficulty = "quick"

    elsif(check =~ /will be a simple matter for you to disarm/ ||
    check =~ /You think this trap is precisely at your skill level/)
     @difficulty = "normal"

    elsif(
     check =~ /A bent needle sticks harmlessly/ ||
     check =~ /It seems far enough away from the lock to be harmless/ ||
     check =~ /that the dart has been moved too far out of position for the mechanism to function properly/ ||
     check =~ /but whatever it was has been pried out/ ||
     check =~ /indicating the trap is no longer a danger/ ||
     check =~ /rendering it harmless/ ||
     check =~ /have been bent in such a way that they no longer will function/ ||
     check =~ /trap harmless/ ||
     check =~ /A row of concealed openings on the front of the strongbox/ ||
     check =~ /rests a small deflated bladder/ ||
     check =~ /You deem it quite safe/ ||
     check =~ /You guess it is already disarmed/ ||
     check =~ /have been bent/ ||
     check =~ /a tiny metal lever has been bent away from the casing/)
      @difficulty = "disarmed"
      @disarmed   = true

    else
      @difficulty = "not identified"
    end
  end
end
