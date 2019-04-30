# frozen_string_literal: true

class Building < ApplicationRecord
  has_many :characters, as: :defensible
  validates :name, presence: true
end
