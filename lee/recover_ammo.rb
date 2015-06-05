class RecoverAmmo
  GOT_ALL = Regexp.union([
    /Stow what/,
    /./,
  ])

  def initialize(ammo)
    get_all ammo
  end

  def get_all ammo
    check = dothis("stow #{ammo}", GOT_ALL)
    none_left = got_all? check
    get_all ammo unless none_left
  end

  def got_all? check
    if (check =~ /Stow what/)
      true
    else
      false
    end
  end
end
