require 'rails_helper'

RSpec.describe Samurai, type: :model do
  it { should belong_to(:clan) }

  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_least(2).is_at_most(256) }
  it { should validate_presence_of(:armor_quality) }
  it { should validate_numericality_of(:armor_quality).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(1000) }
  it { should validate_presence_of(:battle_count) }
  it { should validate_presence_of(:joined_at) }
  it { should validate_presence_of(:clan_id) }
  it { should allow_value(nil).for(:died_at) }
end