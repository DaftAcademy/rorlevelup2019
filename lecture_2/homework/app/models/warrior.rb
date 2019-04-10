class Warrior < ApplicationRecord
  after_create :leads_of_warrior
  # belongs_to :defensible, polymorphic: true
  belongs_to :clan

  validates :name, presence: true
  validates :armor_quality, numericality: { only_integer: true,
                                            greater_than_or_equal_to: 0,
                                            less_than_or_equal_to: 100 }
  validates :kind, inclusion: { in: %w(Samurai Hussar Archer Peasant Wizard) }

  validates_uniqueness_of :name, scope: [:clan_id, :death_date]

  scope :alive, -> { where('death_date IS NULL') }
  scope :dead, -> { where('death_date IS NOT NULL') }

  def leads_of_warrior
    puts "++++ You've created new #{kind} #{name}!++++\n---- Your clan #{Clan.find(clan_id).name} has now #{Clan.find(clan_id).warriors.count} warriors----\n"
  end
end
