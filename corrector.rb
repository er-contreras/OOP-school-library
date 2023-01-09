class Corrector
  def correct_name(name)
    name.gsub(/\b\w/, &:upcase).slice(0, 10)
  end
end
