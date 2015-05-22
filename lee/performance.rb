class Performance
  DONE = Regexp.union([/You finish playing/, /Roundtime/])

  def initialize(style="ditty off")
    fput "stow right"
    fput "stow left"
    fput "get whistle"
    fput "play #{style}"
  end
end
