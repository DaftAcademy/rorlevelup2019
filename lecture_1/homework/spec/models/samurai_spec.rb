require 'rails_helper'

RSpec.describe Samurai, type: :model do
  it { should belong_to(:clan) }
  it { should validate_presence_of(:name) }
end
