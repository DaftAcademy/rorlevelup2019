# frozen_string_literal: true

RSpec.shared_examples_for 'created' do
  it 'responds with 201' do
    expect(response.status).to eq(201)
  end
end
