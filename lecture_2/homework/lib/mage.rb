# frozen_string_literal: true

module Mage
  extend ActiveSupport::Concern
  included do
    validates :profession, presence: true, inclusion: { in: %w[mage] }
  end
  # validates :weapon, inclusion: { in: "magical_weapon"}, allow_nil: true
  # validates :profession, presence: true, inclusion: { in: %w(mage)}
  #  def attack
  #    "#{name}: Pew pew pew! Whizzzz! <put some magic noises here>"
  #  end
end
