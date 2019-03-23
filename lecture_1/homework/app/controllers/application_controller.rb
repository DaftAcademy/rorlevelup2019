class ApplicationController < ActionController::API
  private

  def limit
    limit = params[:limit] || 20
    limit.to_i
  end
end
