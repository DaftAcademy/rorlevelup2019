# frozen_string_literal: true

class Building < ApplicationRecord
  has_many :warriors, dependent: :nullify
end
