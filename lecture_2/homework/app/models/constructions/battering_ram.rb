# frozen_string_literal: true

module Constructions
  class BatteringRam < ApplicationRecord
    has_many :warriors, as: :defensible
  end
end
