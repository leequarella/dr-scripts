class EmptyBox
  def initialize(box)
    fput "open my #{box}"
    fput "fill pou with my #{box}"
    fput "fill apron with my #{box}"
    (1..4).each do |i|
      fput "get coin"
    end
    fput "disma my #{box}"
    fput "disma my #{box}"
  end
end
