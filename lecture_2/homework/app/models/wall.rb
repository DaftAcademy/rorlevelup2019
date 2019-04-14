# frozen_string_literal: true

class Wall < ApplicationRecord
  has_many :warriors, as: :defensible
end
