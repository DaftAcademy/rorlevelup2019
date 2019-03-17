class Samurai < ApplicationRecord

  belongs_to :clan

  validates armour, presence: true, numericality: { greather_than: 0, less_than: 1000 }
  validates name, presence :true

end
