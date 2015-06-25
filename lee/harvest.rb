class Harvest
  HARVEST = Regexp.union([
    /You fumble around with the trap apparatus/,
    /much for it to be successfully harvested/,
    /completely unsuitable for harvesting/,
    /previous trap have already been completely harvested/,
    /Roundtime/,
  ])

  ANALYZE = Regexp.union([
    /You've already analyzed/,
    /You are unable to determine a proper method/,
    /Roundtime/,
  ])

  PARTS = Regexp.union([
    /leg/,
    /face/,
    /seal/,
    /crystal/,
    /tube/,
    /rune/,
    /needle/,
    /reservoir/,
    /striker/,
    /blade/,
    /spring/,
    /cube/,
    /studs/,
    /disc/,
    /vial/,
    /pin/,
    /hammer/,
    /nothing in your left hand/,
  ])

  def initialize(box)
    analyze box
  end

  def analyze box
    check = dothis("DISARM MY #{box} ANALYZE", ANALYZE)
    waitrt?
    if check =~ /You are unable to determine a proper method/
      analyze box
    else
      harvest box
    end
  end

  def harvest box
    check = dothis("DISARM MY #{box} HARV", HARVEST)
    waitrt?
    if check =~ /You fumble around with the trap apparatus/
      harvest box
    elsif
     check =~/much for it to be successfully harvested/ ||
     check =~ /completely unsuitable for harvesting/ ||
     check =~ /previous trap have already been completely harvested/
     failed
    else
      success
    end
  end

  def failed
    fput "FAILED!!!!!!!!!!!!!!"
  end

  def success
    check = dothis("glance", PARTS)
    if check =~ /leg/
      part = "leg"
    elsif check =~ /face/
      part = "face"
    elsif check =~ /seal/
      part = "seal"
    elsif check =~ /crystal/
      part = "crystal"
    elsif check =~ /tube/
      part = "tube"
    elsif check =~ /rune/
      part = "rune"
    elsif check =~ /needle/
      part = "needle"
    elsif check =~ /reservoir/
      part = "reservoir"
    elsif check =~ /striker/
      part = "striker"
    elsif check =~ /blade/
      part = "blade"
    elsif check =~ /spring/
      part = "spring"
    elsif check =~ /cube/
      part = "cube"
    elsif check =~ /studs/
      part = "studs"
    elsif check =~ /disc/
      part = "disc"
    elsif check =~ /vial/
      part = "vial"
    elsif check =~ /pin/
      part = "pin"
    elsif check =~ /hammer/
      part = "hammer"
    end
    fput "put #{part} in my sack"
  end
end
