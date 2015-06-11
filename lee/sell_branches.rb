class SellBranches
  DONE = Regexp.union([/What were you referring to/, /You get a/, /You are already/])
  def initialize
    sell
  end

  def sell
    check = dothis('get branch', DONE)
    waitrt?
    unless done? check
      fput 'give branch to mags'
      sell
    end
  end

  def done? check
    if check =~ /What were you referring to/
      true
    else
      false
    end
  end
end
