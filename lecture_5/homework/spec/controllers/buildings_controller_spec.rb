# frozen_string_literal: true

RSpec.describe BuildingsController, type: :controller do
  describe 'GET /buildings' do
    before { get '/buildings' }
    context 'with valid params' do
      context 'with correct name' do
        include_examples 'OK'
      end
    end
  end
  describe 'POST /buildings' do
    before { post '/buildings', params: params }
    context 'with valid params' do
      context 'with correct name' do
        let(:params) { { name: 'ABCD', type: 'Buildings::Walls' } }
        include_examples 'created'
      end
    end
    context 'with invalid params' do
      context 'with too short name' do
        let(:params) { { name: 'a' } }
        include_examples 'unprocessable entity'
      end
      context 'with blank name' do
        let(:params) { { name: nil } }
        include_examples 'unprocessable entity'
      end
    end
  end
end

# rspec ./spec/services/reports/siege_report_spec.rb:93 # Reports::SiegeReport#call with 1 hussar, 1 samurai and 11 supplies returns 0
# rspec ./spec/services/reports/siege_report_spec.rb:106 # Reports::SiegeReport#call with 1 hussar, 1 samurai and 12 supplies returns 0
# rspec ./spec/services/reports/siege_report_spec.rb:118 # Reports::SiegeReport#call with 1 hussar, 1 samurai and 13 supplies returns 1
# ||||
# vvvv

# BuildingsController POST /buildings with valid params with correct name
# responds with 201
# Failure/Error: before { post '/buildings', params: params }

# ActionController::UrlGenerationError:
# No route matches {:action=>"/buildings", :controller=>"buildings",
# :name=>"ABCD", :type=>"Buildings::Walls"}
# Shared Example Group: "created" called from ./spec/controllers/
# buildings_controller_spec.rb:17
# # ./spec/controllers/buildings_controller_spec.rb:13:in `block
# (3 levels) in <main>'
