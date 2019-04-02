class ApplicationController < ActionController::API
  before_action :set_raven_context
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_err
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

  def render_not_found_err (exception)
    render json: exception, status: 404
  end

  def render_invalid (exception)
    render json: { message: exception.record.errors }, status: 422
  end

  private

  def set_raven_context
    Raven.user_context(id: session[:current_user_id]) # or anything else in session
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
  
end
