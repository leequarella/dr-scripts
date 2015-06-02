class Gear
  ARMOR = [
    "glove",
    "buckler",
    "leath",
    "knu",
    "helm",
  ]

  def self.undress
    fput "stow left"
    fput "stow right"
    ARMOR.each do |a|
      fput "rem #{a}"
      waitrt?
      fput "stow"
    end
  end

  def self.dress
    fput "stow left"
    fput "stow right"
    ARMOR.each do |a|
      fput "get #{a}"
      fput "wear #{a}"
    end
  end
end
