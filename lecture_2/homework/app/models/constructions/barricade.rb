# frozen_string_literal: true

module Constructions
  class Barricade < ApplicationRecord
    has_many :warriors, as: :defensible
  end
end
