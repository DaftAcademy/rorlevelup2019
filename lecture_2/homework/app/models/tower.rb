# frozen_string_literal: true

class Tower < ApplicationRecord
  has_many :warriors, as: :defensible
end
