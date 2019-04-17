# frozen_string_literal: true

RSpec.shared_examples_for 'OK' do
  it 'responds with 200' do
    expect(response.status).to eq(200)
  end
end
