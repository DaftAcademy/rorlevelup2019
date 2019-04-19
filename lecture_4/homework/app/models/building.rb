# frozen_string_literal: true

class Building < ApplicationRecord
  has_many :warriors, dependent: :nullify
  validates :name, presence: true, uniqueness: true
end
