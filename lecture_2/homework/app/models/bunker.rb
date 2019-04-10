# frozen_string_literal: true

class Bunker < ApplicationRecord
  has_many :warriors, as: :defensible
end
