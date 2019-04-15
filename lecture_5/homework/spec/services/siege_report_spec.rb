RSpec.describe SiegeReport, type: :service do
  describe '#sum' do
    it 'adds two and two' do
      expect(SiegeReport.new(first_number: 2, second_number: 2).sum).to eq(4)
end end
end