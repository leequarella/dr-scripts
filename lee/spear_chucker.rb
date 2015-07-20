class SpearChucker
  def initialize(creature)
    fput "untie spear"
    Lob.new("spear", creature)
    fput "get spear"
    fput "tie spear to st tool"
  end
end
