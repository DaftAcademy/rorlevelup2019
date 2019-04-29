# frozen_string_literal: true

class Gate < ApplicationRecord
  has_many :warriors, as: :defensible
end
