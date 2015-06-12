class Performance
  DONE = Regexp.union([/You finish playing/])

  def initialize(style="ditty halt")
    fput "stow right"
    fput "stow left"
    fput "get whistle"
    play(style)
  end

  def play(style)
    fput "play #{style}"
    waitfor "You finish playing"
  end

end
