class Gear
  ARMOR = ["helm",
           "glove",
           "buckler",
           "leath",
           "knu",
           "stick"]

  def self.undress
    fput "stow left"
    fput "stow right"
    ARMOR.each do |a|
      fput "rem #{a}"
      fput "stow"
    end
  end

  def self.undress
    fput "stow left"
    fput "stow right"
    ARMOR.each do |a|
      fput "get #{a}"
      fput "wear #{a}"
    end
  end
end
