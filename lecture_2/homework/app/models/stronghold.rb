# frozen_string_literal: true

class Stronghold < ApplicationRecord
  has_many :warriors, as: :defensible
end
