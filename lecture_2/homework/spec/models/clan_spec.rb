# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Clan, model: :clan do
  let(:clan) { create(:clan) }

  it { should have_many(:warriors).dependent(:destroy) }

  context 'Clans should have name' do
    it 'is valid' do
      expect(clan).to be_valid
    end
  end
end
