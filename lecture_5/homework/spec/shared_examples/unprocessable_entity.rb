# frozen_string_literal: true

RSpec.shared_examples_for 'unprocessable entity' do
  it 'responds with 422' do
    expect(response.status).to eq(422)
  end
end
