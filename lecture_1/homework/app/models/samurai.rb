class Samurai < ApplicationRecord
  belongs_to :clan
  validates_presence_of :name, on: :create
  validates :armor_quality, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100}
   scope :alive, -> { where('death_date IS NULL')}
   scope :dead, -> {where('death_date IS NOT NULL')}
  # Ex:- scope :active, -> {where(:active => true)}
end
