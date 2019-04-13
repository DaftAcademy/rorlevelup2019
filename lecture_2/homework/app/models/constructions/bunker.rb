# frozen_string_literal: true

module Costructions
  class Bunker < ApplicationRecord
    has_many :warriors, as: :defensible
  end
end
