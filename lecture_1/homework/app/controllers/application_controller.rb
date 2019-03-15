class ApplicationController < ActionController::API
  private

  def default_limit
    params[:limit] = 20 if limit.zero?
  end

  def limit
    params[:limit].to_i
  end
end
