# frozen_string_literal: true

class Clan < ApplicationRecord
  belongs_to :clan
  belongs_to :defensible, polymorphic: true

  has_many :warriors, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
