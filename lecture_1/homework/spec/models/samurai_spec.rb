require 'rails_helper'

RSpec.describe Samurai, type: :model do
   it { should belong_to(:clan) }
   it { should validate_presence_of(:name) }
   it { should validate_uniqueness_of(:name) }
   it { should validate_presence_of(:armor) }
   it { should validate_numericality_of(:armor).only_integer }
   it { should validate_inclusion_of(:armor).in_range(0..1000) }
   it { should validate_presence_of(:battles_count) }
   it { should validate_numericality_of(:battles_count).only_integer }
end
