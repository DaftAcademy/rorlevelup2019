module Ranger
  extend ActiveSupport::Concern
  included do
    validates :profession, presence: true, inclusion: { in: %w(ranger)}
  end
  #validates :weapon, inclusion: { in: "ranged_weapon"}, allow_nil: true
  #validates :profession, presence: true, inclusion: { in: %w(ranger)}
#  def attack
#    "#{name}: Ftong! Swoosh! *arrow hit noise*"
#  end
end
