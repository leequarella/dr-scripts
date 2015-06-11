class Burden
  OVERBURDENED = Regexp.union([
    /Light Burden/,
    /Somewhat Burdened/,
    /Burdened/,
    /Heavy Burden/,
  ])
  def self.overburdened?
    check = dothis("encum", OVERBURDENED)
    if check =~ /Light Burden/ ||
    check =~ /Somewhat Burdened/ ||
    check =~ /Burdened/
      false
    else
      true
    end
  end
end
