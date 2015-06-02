class GetBox
  attr_accessor :box_name
  BOXES = Regexp.union([
    /caddy/,
    /strong/,
    /chest/,
    /box/,
    /skip/,
    /nothing/,
    /trunk/,
    /coffer/,
  ])

  def initialize(container)
    @container = container
    fput "stow left"
    fput "stow right"
    find_box
  end

  def find_box
    fput "get my #{@container}"
    check = dothis("look in my #{@container}", BOXES)
    box_found? check
    fput "stow my #{@container}"
  end

  def box_found? check
    if(check =~ /caddy/)
      fput "get caddy from my #{@container}"
      @box_name = "caddy"
    elsif(check =~ /strong/)
      fput "get stron from my #{@container}"
      @box_name = "stron"
    elsif(check =~ /chest/)
      fput "get chest from my #{@container}"
      @box_name = "chest"
    elsif(check =~ /skip/)
      fput "get skip from my #{@container}"
      @box_name = "skip"
    elsif(check =~ /trunk/)
      fput "get trunk from my #{@container}"
      @box_name = "trunk"
    elsif(check =~ /coffer/)
      fput "get coffer from my #{@container}"
      @box_name = "coffer"
    elsif(check =~ /box/)
      fput "get box from my #{@container}"
      @box_name = "box"
    else
      @box_name = "none left"
    end
  end

end
