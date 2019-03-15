class ApplicationController < ActionController::API
  protected

  def default_limit
    params[:limit] = 20 if params[:limit].to_i.zero?
  end
end
