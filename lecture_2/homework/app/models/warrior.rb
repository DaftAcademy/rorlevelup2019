class Warrior < ApplicationRecord
    belongs_to :clan
    belongs_to :defensible, polymorphic: true
    has_one :weapon, as: :attackable

    validates :name, presence: true, uniqueness: { scope: :clan_id }, if: Proc.new { |it| it.death_date.blank? }, on: :update
    validates :name, presence: true, uniqueness: { scope: :clan_id }, unless: Proc.new { |it| it.death_date.blank? }, on: :create
    
    validates :armor_quality, numericality: { only_integer: true,
                                            greater_than_or_equal_to: 0,
                                            less_than_or_equal_to: 100 }

    scope :alive, -> { where('death_date IS NULL') }
    scope :dead, -> { where('death_date IS NOT NULL') }
end
