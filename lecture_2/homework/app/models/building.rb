class Building < ApplicationRecord
  has_many :warriors, as: :defensible

  validates :name, presence: true
  validates :defense, numericality: { only_integer: true }, inclusion: { :in => 0..1000, :message => "Defense should be integer between 0 and 1000" }
end
