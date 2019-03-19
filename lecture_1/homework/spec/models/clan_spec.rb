require 'rails_helper'

RSpec.describe Clan, type: :model do
  it { should have_many(:samurais).dependent(:destroy) }

  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_least(2).is_at_most(256) }
end
