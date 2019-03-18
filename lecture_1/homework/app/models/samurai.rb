class Samurai < ApplicationRecord
  after_initialize :set_defaults
  belongs_to :clan

  validates :name, presence: true, length: { maximum: 100 }
  validates :cuirass_quality, presence: true, numericality: { greater_than: 0, less_than: 1000 }
  validates :battles_count, presence: true
  validates :joined_date, presence: true

  def set_defaults
    self.battles_count ||= 0
    self.death_date ||= nil
  end
end
