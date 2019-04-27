# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reports::SiegeReport, type: :service do
  subject(:siege_report) { described_class.new(params).call }

  let(:params)   { { building: building } }
  let(:building) { create(:building, warriors: army) }
  let(:army)     { [] }

  describe '#call' do
    context 'with building without army' do
      it 'returns report with siege ability equals to 0' do
        expect(subject).to eq(0.0)
      end
    end
  end
end
