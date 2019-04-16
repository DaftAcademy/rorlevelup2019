# frozen_string_literal: true

class Warrior < ApplicationRecord
    belongs_to :clan
    belongs_to :building
    has_one :weapon, inverse_of: :warrior
    accepts_nested_attributes_for :weapon

    validates_presence_of :weapon
  
    validates :name, presence: true, length: { maximum: 256 }
    validates_uniqueness_of :name, scope: :clan_id, conditions: -> { where(death_date: 'nil') }, message: "There can be only one living samurai of that name in a clan."

    validates :armor, presence: true, numericality: { greater_than: 0, less_than: 1000, only_integer: true }
    validates :battles, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
    validates :join_date, presence: true
    validate :death_date_after_join_date
  
    def death_date_after_join_date
      return if death_date.nil?
      errors.add(:death_date, "can't be before join date") if death_date < join_date
    end

    def Alive
      return death_date.nil?
    end
  end