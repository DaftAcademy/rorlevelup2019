# frozen_string_literal: true

class Building < ApplicationRecord
    has_many :warriors, dependent: :nullify
    has_one :granary, inverse_of: :building
    accepts_nested_attributes_for :granary

    validates_presence_of :granary

    validates :name, presence: true, length: { maximum: 256 }
    validates_uniqueness_of :name
end