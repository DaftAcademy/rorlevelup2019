# frozen_string_literal: true

class NullWeapon
  def type
    'bare hands'
  end

  def self.create!(*args); end
end
