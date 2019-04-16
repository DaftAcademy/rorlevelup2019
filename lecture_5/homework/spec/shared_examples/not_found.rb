# frozen_string_literal: true

RSpec.shared_examples_for 'not found' do
  it 'responds with 404' do
    expect(response.status).to eq(404)
  end
end