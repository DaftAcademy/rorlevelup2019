require 'rails_helper'

RSpec.describe Clan, type: :model do
  subject(:clan) { create :clan }

  it { is_expected.to be_valid }

  it { is_expected.to validate_uniqueness_of :name }
end
