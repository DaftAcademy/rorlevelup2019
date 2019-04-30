# frozen_string_literal: true

module Warrior
  extend ActiveSupport::Concern
  included do
    validates :profession, presence: true, inclusion: { in: %w[warrior] }
  end

  # validates :weapon, inclusion: { in: "melee_weapon"}, allow_nil: true
  # validates :profession, presence: true, inclusion: { in: %w(warrior)}
  #  def attack
  #    "#{name}: *melee noises*"
  #  end
end
