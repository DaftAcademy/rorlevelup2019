# frozen_string_literal: true

class Barricade < ApplicationRecord
  has_many :warriors, as: :defensible
end
