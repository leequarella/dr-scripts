class Stance
  class << self
    def balanced
      fput "stance parry 61"
      waitrt?
      fput "stance shield 61"
      waitrt?
      fput "stance evasion 61"
      waitrt?
    end

    def missle
      fput "stance parry 0"
      fput "stance shield 91"
      fput "stance evasion 92"
    end

    def zero
      fput "stance parry 0"
      fput "stance shield 0"
      fput "stance evasion 0"
    end
  end
end
