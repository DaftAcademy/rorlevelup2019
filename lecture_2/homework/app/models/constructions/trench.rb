# frozen_string_literal: true

module Constructions
  class Trench < ApplicationRecord
    has_many :warriors, as: :defensible
  end
end
