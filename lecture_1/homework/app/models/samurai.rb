class Samurai < ApplicationRecord
  belongs_to :clan
  
  validates :name, presence: true, length: {minimum: 2, maximum: 50, :message => "Name should be between 2 and 50 signs"}
  validates :armor_class, presence: true, numericality: {only_integer: true, :message => "Armor class should be integer"}, inclusion: {:in => 0..1000, :message => "Armor class should be integer between 0 and 1000"}
  validates :battle_no, presence: true, numericality: {minimum: 0, only_integer: true, :message => "Battle no. should be integer, equal or greater then 0"}
  validates :join_date, presence: true
end
