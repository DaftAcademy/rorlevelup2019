class NullWeapon

  def type
    "bare hands"
  end

  def kind
    "melee"
  end

  def range
    1
  end

  def damage
    1
  end

  # Returns self if method not defined so chain is not broken
  def method_missing(*args, &block)
    self
  end

end
