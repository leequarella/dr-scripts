class Gear
  ARMOR = [
    "glove",
    "buckler",
    "leath",
    "knu",
    "stick",
    "helm",
  ]

  def self.undress
    fput "stow"
    ARMOR.each do |a|
      fput "rem #{a}"
      waitrt?
      fput "stow"
    end
      fput "stow left"
  end

  def self.dress
    fput "stow"
    ARMOR.each do |a|
      fput "get #{a}"
      fput "wear #{a}"
    end
  end
end
