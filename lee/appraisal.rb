class Appraisal
  COMBAT = ["leather", "foot", "stick", "buckler", "knu", "spike"]
  def initialize(items=nil)
    @items = items || COMBAT
    @index = 0
  end

  def next
    fput "appr my #{@items[@index]}"
    @index += 1
    @index = 0 if @index == COMBAT.length
    waitrt?
  end
end
