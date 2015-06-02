class Disarm
  attr_reader :sprung, :disarmed, :more_traps
  DISARMING = Regexp.union([
    /not yet fully disarmed/,
    /proves too difficult to manipulate/,
    /something to shift/,
    /lock springs out and stabs you painfully in the finger/,
    /An acrid stream of sulfurous air hisses quietly/,
    /A stream of corrosive acid sprays out from the/,
    /With a sinister swishing noise, a deadly sharp scythe blade whips out the front of the/,
    /There is a sudden flash of greenish light, and a huge electrical charge sends you flying/,
    /A stoppered vial opens with a pop and cloud of thick green vapor begins to pour out of the/,
    /breaks in half. A glass sphere on the seal begins to glow with an eerie black light/,
    /Just as your ears register the sound of a sharp snap/,
    /Looking at the needle, you notice with horror the rust colored coating on the tip/,
    /You barely have time to register a faint click before a blinding flash explodes around you/,
    /Moving with the grace of a pregnant goat, you carelessly flick at the piece of metal causing/,
    /You make a small hole in the side of the box and take deep breath to blow the powder free but a /,
    /With a cautious hand, you attempt to undo the string tying the bladder to the locking mechanism /,
    /The dart flies though your fingers and plants itself solidly in your forehead!/,
    /Almost casually, you press on the tiny hammer set to break the tube. The hammer slips from its locked/,
    /Nothing happened. Maybe it was a dud./,
    /You get a feeling that something isn't right. Before you have time to think what it might be you find/,
    /and emits a sound like tormented souls being freed, then fades away suddenly./,
    /has gotten much bigger!/,
    /and clumsily shred the fatty bladder behind it in the process/,
    /liquid shadows/,
    /You wiggle the milky-white tube back and forth for a few moments in an attempt to remove it from/,
    /With a nasty look and a liberal amount of hurled, unladylike epithets, she wiggles back inside and slams/,
    /Not sure where to start, you begin by prying off the body of the crusty scarab, hoping to break it free/,
    /You feel like you've done a good job of blocking up the pinholes, until you peer closely to examine /,
    /You work with the trap for a while but are unable to make any progress/,
    /for a while but are unable to make any progress/,
    /you feel satisfied that the trap/,
    /you carefully pry at the studs working them/,
    /you manage to bend it well away from the mesh bag/,
    /allowing it to be opened safely/,
    /Roundtime/,
  ])

  def initialize(box, difficulty)
    @box        = box
    @difficulty = difficulty
    @sprung     = false
    @disarmed = false
    disarm
  end

  def disarm
    verb = "DISARM MY #{@box} #{@difficulty}"
    check = dothis verb,  DISARMING
    waitrt?
    disarmed? check
    disarm unless @disarmed || @sprung
  end

  def disarmed? check
    if(check =~ /not yet fully disarmed/)
      fput "NOT DISARMED, MOAR TRAPS!!!!!"
      @disarmed = true
      @more_traps = true

    elsif(check =~ /lock springs out and stabs you painfully in the finger/ ||
     check =~ /An acrid stream of sulfurous air hisses quietly/ ||
     check =~ /A stream of corrosive acid sprays out from the/ ||
     check =~ /With a sinister swishing noise, a deadly sharp scythe blade whips out the front of the/ ||
     check =~ /There is a sudden flash of greenish light, and a huge electrical charge sends you flying/ ||
     check =~ /A stoppered vial opens with a pop and cloud of thick green vapor begins to pour out of the/
     check =~ /breaks in half. A glass sphere on the seal begins to glow with an eerie black light/ ||
     check =~ /Just as your ears register the sound of a sharp snap/ ||
     check =~ /Looking at the needle, you notice with horror the rust colored coating on the tip/ ||
     check =~ /You barely have time to register a faint click before a blinding flash explodes around you/ ||
     check =~ /Moving with the grace of a pregnant goat, you carelessly flick at the piece of metal causing/ ||
     check =~ /You make a small hole in the side of the box and take deep breath to blow the powder free but a / ||
     check =~ /With a cautious hand, you attempt to undo the string tying the bladder to the locking mechanism / ||
     check =~ /The dart flies though your fingers and plants itself solidly in your forehead!/ ||
     check =~ /Almost casually, you press on the tiny hammer set to break the tube. The hammer slips from its locked/ ||
     check =~ /Nothing happened. Maybe it was a dud./ ||
     check =~ /You get a feeling that something isn't right. Before you have time to think what it might be you find/ ||
     check =~ /and emits a sound like tormented souls being freed, then fades away suddenly./ ||
     check =~ /has gotten much bigger!/ ||
     check =~ /and clumsily shred the fatty bladder behind it in the process/ ||
     check =~ /liquid shadows/ ||
     check =~ /You wiggle the milky-white tube back and forth for a few moments in an attempt to remove it from/ ||
     check =~ /With a nasty look and a liberal amount of hurled, unladylike epithets, she wiggles back inside and slams/ ||
     check =~ /Not sure where to start, you begin by prying off the body of the crusty scarab, hoping to break it free/ ||
     check =~ /You feel like you've done a good job of blocking up the pinholes, until you peer closely to examine /)
      sprung!

    elsif(check =~ /something to shift/)
      be_careful!

    else
      @disarmed   = true
    end
  end

  def sprung!
    @sprung = true
  end

  def be_careful!
    @difficulty = "careful"
  end
end
